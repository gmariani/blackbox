package {
	
	import flash.events.MouseEvent;
	import flash.events.FocusEvent;
	import gs.TweenFilterLite;
	import fl.transitions.easing.*;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
    import flash.net.navigateToURL;
	import flash.net.URLVariables;
	import flash.net.URLRequestMethod;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import fl.controls.Button;
	import SecurityError;
	import ArgumentError;
	import Date;
	import MD5;

	public class Login extends MovieClip {
		
		private var username:String;
		private var password:String;
		private var localNum:Number;
		private var serverNum:Number;
		private var _isReady:Boolean = false;
		private var _isLoggedIn:Boolean = false;
		private var lastpage:*;
		private var usernameInput:TextField;
		private var passwordInput:TextField;
		private var colorError:int = 0xD50000;
		private var colorSelect:int = 0x5D5D5D;
		private var bright:int = 2;
		private var nTabCount:int = 0;
		
		public function Login() {
			usernameInput = mcName.getChildByName("txtInput") as TextField;
			passwordInput = mcPass.getChildByName("txtInput") as TextField;
			var qs:QueryString = new QueryString();
			lastpage = qs.parameters.lastpage;
			
			mcCheck.alpha = 0;
			mcCheck.visible = false;
			
			mcName.txtInput.text = "UserName";
			initField(mcName);
			
			mcPass.txtInput.text = "Password";
			initField(mcPass);
			
			mcLogo.addEventListener(MouseEvent.MOUSE_DOWN, logoHandler);
			
			btnLogin.addEventListener(MouseEvent.MOUSE_DOWN, loginClick);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, reportKeyDown);
		}
		
		public function get isReady():Boolean { return _isReady }
		public function get isLoggedIn():Boolean { return _isLoggedIn }
		
		public function loginClick (e:MouseEvent) {
			stage.focus = btnLogin;
			doLogin();
		}
		
		public function doLogin():void {
			btnLogin.enabled = false;
			TweenFilterLite.to(mcCheck, .5, { autoAlpha:1 });
			
			handShake(usernameInput.text, passwordInput.text);
		}
		
		public function login():void {
			if(!isReady) return;
			
			// Create password
			
			username = usernameInput.text;
			password = passwordInput.text;
			
			//save session variable with local time saveRemoteTime.php;
			var t:Number = Math.abs(localNum - serverNum);
			var newPass:String = MD5.encrypt(String(password+t));
			
			var request:URLRequest = new URLRequest("login.php");
			var vars:URLVariables = new URLVariables();
			vars.u = username;
			vars.p = newPass;
			request.data = vars;
			request.method = URLRequestMethod.POST;
			
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, loginHandler);
			try	{
				loader.load(request);
			} catch (error:ArgumentError) {
				trace("An ArgumentError has occurred.");
			} catch (error:SecurityError) {
				trace("A SecurityError has occurred.");
			} catch (error:Error) {
				trace("Unable to load requested document.");
			}
		}
		
		private function logoHandler(e:MouseEvent):void {
			var req:URLRequest = new URLRequest("http://www.coursevector.com/");
			navigateToURL(req);
		}
		
		private function loginHandler(e:Event):void {
			var loader:URLLoader = e.target as URLLoader;
			var vars:URLVariables = new URLVariables(loader.data);
			
			// Not used to determine if logged, used purely to notify Flash. PHP will determine
			// at each call if they are logged in or not and reacte accordingly.
			_isLoggedIn = vars.success;
			if(String(vars.success) == "true") {
				if(lastpage == null || lastpage == undefined) lastpage = "secret.php";
				navigateToURL(new URLRequest(lastpage), '_self');
			} else {
				//play wrong animation
				TweenFilterLite.to(mcName.getChildByName("mcBG"), .5, {type:"Color", colorize:colorError, brightness:bright});
				TweenFilterLite.to(mcPass.getChildByName("mcBG"), .5, {type:"Color", colorize:colorError, brightness:bright});
				TweenFilterLite.to(mcCheck, .5, { autoAlpha:0 });
				btnLogin.enabled = true;
			}
		}
		
		private function handshakeHandler(e:Event):void {
			//trace( "handshakeHandler" );
			var loader:URLLoader = e.target as URLLoader;
			var vars:URLVariables = new URLVariables(loader.data);
			serverNum = vars.serverNum;
			_isReady = true;
			login();
		}
		
		private function setFocusHandler(e:FocusEvent):void {
			var txtInput:TextField = e.currentTarget as TextField;
			var mc:MovieClip = txtInput.parent as MovieClip;
			if(mc == mcPass) txtInput.displayAsPassword = true;
			if (txtInput.text == mc.strLabel) txtInput.text = "";
			TweenFilterLite.to(txtInput.parent.getChildByName("mcBG"), .5, {type:"Color", colorize:colorSelect, brightness:bright});
		};
		
		private function killFocusHandler(e:FocusEvent):void {
			var txtInput:TextField = e.currentTarget as TextField;
			TweenFilterLite.to(txtInput.parent.getChildByName("mcBG"), .5, {type:"Color"});
		};
		
		private function reportKeyDown(event:KeyboardEvent):void {
			switch(event.charCode) {
				case 13:
					doLogin();
			}
        }
		
		private function handShake(u:String, p:String):void {
			username = u;
			password = p;
			
			localNum = int((Math.random() * 14200) + 14);
			
			var request:URLRequest = new URLRequest("handshake.php");
			var vars:URLVariables = new URLVariables();
			vars.localNum = localNum;
			vars.username = username;
		 	request.data = vars;
			request.method = URLRequestMethod.GET;
			
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, handshakeHandler);
			try	{
				loader.load(request);
			} catch (error:ArgumentError) {
				trace("An ArgumentError has occurred.");
			} catch (error:SecurityError) {
				trace("A SecurityError has occurred.");
			} catch (error:Error) {
				trace("Unable to load requested document.");
			}
		}
		
		private function initField(mc:MovieClip):void {
			var txtInput:TextField = mc.getChildByName("txtInput") as TextField;
			mc.strLabel = txtInput.text;
			txtInput.tabIndex = ++nTabCount;
			txtInput.addEventListener(FocusEvent.FOCUS_IN, setFocusHandler);
			txtInput.addEventListener(FocusEvent.FOCUS_OUT, killFocusHandler);
		}
	}
}