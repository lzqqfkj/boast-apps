// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

/*
 * file upload via iframeRequest 
 * by hirainchen@gmail.com
 * @create 2007-7-4 16:40
 * @update 2007-7-17 0:01
 */

/*
 * debug
 */
if(typeof console == 'undefined')
{
	console = {debug:function(){}, log:function(){}}
}

/*
 * get application running environment
 */
function appEnv(env)
{
	var current_env = '';
	var scripts = $$('script[src="/javascripts/application.js"]');
	if(scripts.first())
	{
		current_env = 'production';
	}
	else
	{
		current_env = 'development';
	}
	return (env ? current_env == env.toLowerCase() : current_env );
}

/*
 * link: http://pastie.caboo.se/50410#
	Colin Mollenhour - iframesubmit.js
	Adapted from pork.iframe.js (http://beta.zapguide.nl/iframe/)
	usage: new Form.IframeSubmit(form, options);
*/

Form.IframeSubmit = Class.create();
Form.IframeSubmit.prototype = Object.extend(new Ajax.Request(), {
  initialize: function(form, options){
    this.options = Object.extend({
      onComplete: null,
      container: null,
      insertion: Element.update,
	  contentType: form.encoding
    },options || {});
    this.form = form;
    this.uniqueId = new Date().getTime();
    this.iframeName = 'iframe_'+this.uniqueId;
    Form.IframeSubmit.iframeLoaders[this.uniqueId] = this;
    this.transport = this.getTransport();
    form.target= this.iframeName;
    form.setAttribute("target", this.iframeName);
    form.submit();
	//loading
	this.transport.loading();
  },
  onStateChange: function(){
	this.transport.loaded();
	this.transport.interactive();
	this.transport.completed();
  },
  getTransport: function(){
    var divElm = document.createElement('DIV');
    divElm.style.position = "absolute";
    divElm.style.top = "0";
    divElm.style.marginLeft = "-10000px";
    if(navigator.userAgent.indexOf('MSIE') > 0 && navigator.userAgent.indexOf('Opera') == -1){// switch to the crappy solution for IE
     divElm.innerHTML = '<iframe name="'+this.iframeName+'" id="'+this.iframeName+'" src="about:blank" onload="setTimeout(function(){Form.IframeSubmit.iframeLoaders['+this.uniqueId+'].onStateChange()},20);"></iframe>';
    }else{
      var frame = document.createElement("iframe");
      frame.setAttribute("name", this.iframeName);
      frame.setAttribute("id", this.iframeName);
      frame.addEventListener("load",  function(){ this.onStateChange(); }.bind(this), false);
      divElm.appendChild(frame);
    }
    document.getElementsByTagName("body").item(0).appendChild(divElm);
	return new IFRAMEHttpRequest(divElm.firstChild, this);
  }
});
Form.IframeSubmit.iframeLoaders = new Hash();

// IFRAMEHttpRequest class
var IFRAMEHttpRequest = Class.create();
IFRAMEHttpRequest.prototype = Object.extend(new Ajax.Request(), {
	initialize: function(iframe, request) 
	{
		this.iframe = iframe;
		this.request = request;
		this.uninitialized();
	}
	,getResponseText : function()
	{
	    var doc = '';
	    try { doc = this.iframe.contentDocument.document.body.innerHTML; this.iframe.contentDocument.document.close(); } catch (e){ // For NS6
	    try { doc = this.iframe.contentWindow.document.body.innerHTML; this.iframe.contentWindow.document.close(); } catch (e){ // For IE5.5 and IE6
	    try { doc = this.iframe.document.body.innerHTML; this.iframe.document.body.close(); } catch (e) { // for IE5
	    try { doc = window.frames[this.iframeName].document.body.innerText; } catch (e) { } } } } // for really nasty browsers
	    this.responseText = doc;
		return this.responseText;
	}
	,setReadyState :function(readyState)
	{
		this.readyState = readyState;
		if(this.request)
		{
			this.request.respondToReadyState(this.readyState);
		}
	}
	,uninitialized : function()
	{
		this.responseText = '';
		this.status = 0;
		this.setReadyState(0);
	}
	,loading : function()
	{
		if(this.readyState == 0)
		{
			this.setReadyState(1);
		}
	}
	,loaded : function()
	{
		if(this.readyState == 1)
		{
			this.setReadyState(2);
		}
	}
	,interactive : function()
	{
		if(this.readyState == 2)
		{
			this.getResponseText();
			this.setReadyState(3);
		}
	}
	,completed : function()
	{
		if(this.readyState == 3)
		{
			// remove iframe
			setTimeout(function(){
				Form.IframeSubmit.iframeLoaders.remove(this.iframe.uniqueId);
				$(this.iframe.id).up().remove();
			}.bind(this), 10);
			this.status = 200;
			this.setReadyState(4);
			this._complete = true;
			// for debugging
			if(typeof console != 'undefined' && appEnv('development'))
			{
				console.log(this);
			}
		}
	}
});


/*
 * catch form object
 */
Form.lastSerializeForm = null;
Form.oriSerialize = Form.serialize
Object.extend(Form, {
  serialize: function(form, getHash) {
  	Form.lastSerializeForm = form;
    return Form.oriSerialize(form, getHash);
  }
});

/*
 * Overwrite Ajax.Request
 */
Object.extend(Ajax.Request.prototype, {
	initialize: function(url, options) {
	var form = Form.lastSerializeForm;
	Form.lastSerializeForm = null;
	if(form && form.getInputs('file').length && form.readAttribute('ajaxupload')!= 'false')
	{
		// do upload
        if(form.encoding.toLowerCase() != 'multipart/form-data')
        {
            form.encoding = 'multipart/form-data';
        }
        if(form.method.toLowerCase() != 'post')
        {
            form.method = 'post';
        }
		var xhr = document.createElement('input');
		xhr.type = 'hidden';
		xhr.name = 'HTTP_X_REQUESTED_WITH';
		xhr.value = 'IframeRequest';
		form.appendChild(xhr);
		new Form.IframeSubmit(form, options);
		form.removeChild(xhr);
	}
	else // act as normal AJAX Request
	{
	    this.transport = Ajax.getTransport();
	    this.setOptions(options);
	    this.request(url);
	}
  }
});
