<%
'#########################################
'               _ _                 
'      /\      | (_)        1881 - ∞
'     /  \   __| |_  __ _ _ __  ___ 
'    / /\ \ / _` | |/ _` | '_ \/ __|
'   / ____ \ (_| | | (_| | | | \__ \
'  /_/    \_\__,_| |\__,_|_| |_|___/
'  (c)2011      _/ | Digital Agency
'              |__/ 
'#########################################
'* Project  : RabbitCMS
'* Developer: <Anthony Burak DURSUN>
'* E-Mail   : badursun@adjans.com.tr
'* Corp     : https://adjans.com.tr
'* Date     : 24.04.2023
'#########################################

Class Meta_Pixel_Events_Plugin
	Private PLUGIN_CODE, PLUGIN_DB_NAME, PLUGIN_NAME, PLUGIN_VERSION, PLUGIN_CREDITS, PLUGIN_GIT, PLUGIN_DEV_URL, PLUGIN_FILES_ROOT, PLUGIN_ICON, PLUGIN_REMOVABLE, PLUGIN_ROOT, PLUGIN_FOLDER_NAME, PLUGIN_AUTOLOAD

	Private PIXEL_ID, PIXEL_SCRIPT_TEMPLATE

	'---------------------------------------------------------------
	' Register Class
	'---------------------------------------------------------------
	Public Property Get class_register()
		DebugTimer ""& PLUGIN_CODE &" class_register() Start"
		
		' Check Register
		'------------------------------
		If CheckSettings("PLUGIN:"& PLUGIN_CODE &"") = True Then 
			DebugTimer ""& PLUGIN_CODE &" class_registered"
			Exit Property
		End If

		' Register Settings
		'------------------------------
		a=GetSettings("PLUGIN:"& PLUGIN_CODE &"", PLUGIN_CODE)
		a=GetSettings(""&PLUGIN_CODE&"_PLUGIN_NAME", PLUGIN_NAME)
		a=GetSettings(""&PLUGIN_CODE&"_CLASS", "Meta_Pixel_Events_Plugin")
		a=GetSettings(""&PLUGIN_CODE&"_REGISTERED", ""& Now() &"")
		a=GetSettings(""&PLUGIN_CODE&"_CODENO", "1174")
		a=GetSettings(""&PLUGIN_CODE&"_FOLDER", PLUGIN_FOLDER_NAME)

		a=GetSettings(""&PLUGIN_CODE&"_ACTIVE", "1")
		a=GetSettings(""&PLUGIN_CODE&"_PIXEL_ID", "")
		a=GetSettings(""&PLUGIN_CODE&"_PIXEL_SCRIPT", PIXEL_SCRIPT_TEMPLATE)

		' Register Settings
		'------------------------------
		DebugTimer ""& PLUGIN_CODE &" class_register() End"
	End Property
	'---------------------------------------------------------------
	'
	'---------------------------------------------------------------

	'---------------------------------------------------------------
	'
	'---------------------------------------------------------------
	Public sub LoadPanel()
		'--------------------------------------------------------
		' Sub Page 
		'--------------------------------------------------------
		If Query.Data("Page") = "SHOW:HowTo" Then
			Call PluginPage("Header")

			With Response 
				.Write "<p>"
				.Write "	<ol>"
				.Write "		<li>Bir Facebook kullanıcı hesabına ihtiyacınız olacak</li>"
				.Write "		<li>https://developers.facebook.com/ adresine gidin.</li>"
				.Write "		<li>Get Started veya Facebook Login butonuna tıklayın.</li>"
				.Write "		<li>Hesabınızı kaydedin ve doğrulayın</li>"
				.Write "		<li>Facebook uygulamanız için bir ad girin (“RabbitCMS Kurumsal“ gibi bir ad seçebilirsiniz). Bu ad, Facebook Connect üzerinden uygulamada bir hesap oluşturmak istediklerinde kullanıcılara gösterilecek.</li>"
				.Write "		<li>“Bir Senaryo seç“, (Select a Scenario) sayfası altında “Facebook Giriş“ (Integrate Facebook Login) seçin</li>"
				.Write "		<li>Soldaki menüde Ayarlar (Settings)> Temel’e (Basic) gidin .</li>"
				.Write "		<li>Kullanacağınız Uygulama Kimliği (App ID) ve Şifresi (App Secret).</li>"
				.Write "		<li>Eğer ekli değilse sol menüde Products altında Facebook Login eklenmeli.</li>"
				.Write "		<li>İlgili tanımlamaları, domain adresinizi ekleyin.</li>"
				.Write "		<li>Tüm detaylar tamamlandı ise üst bölümde App ID yanında bulunan anahtarı Live hale getirin.</li>"
				.Write "	</ol>"
				.Write "</p>"
			End With

			Call PluginPage("Footer")
			Call SystemTeardown("destroy")
		End If

		If Query.Data("Page") = "SHOW:DefaultTriggers" Then
			Call PluginPage("Header")

			With Response 
				.Write "<p>"
				.Write "	<ol>"
				.Write "		<li>Bir Facebook kullanıcı hesabına ihtiyacınız olacak</li>"
				.Write "		<li>https://developers.facebook.com/ adresine gidin.</li>"
				.Write "		<li>Get Started veya Facebook Login butonuna tıklayın.</li>"
				.Write "		<li>Hesabınızı kaydedin ve doğrulayın</li>"
				.Write "		<li>Facebook uygulamanız için bir ad girin (“RabbitCMS Kurumsal“ gibi bir ad seçebilirsiniz). Bu ad, Facebook Connect üzerinden uygulamada bir hesap oluşturmak istediklerinde kullanıcılara gösterilecek.</li>"
				.Write "		<li>“Bir Senaryo seç“, (Select a Scenario) sayfası altında “Facebook Giriş“ (Integrate Facebook Login) seçin</li>"
				.Write "		<li>Soldaki menüde Ayarlar (Settings)> Temel’e (Basic) gidin .</li>"
				.Write "		<li>Kullanacağınız Uygulama Kimliği (App ID) ve Şifresi (App Secret).</li>"
				.Write "		<li>Eğer ekli değilse sol menüde Products altında Facebook Login eklenmeli.</li>"
				.Write "		<li>İlgili tanımlamaları, domain adresinizi ekleyin.</li>"
				.Write "		<li>Tüm detaylar tamamlandı ise üst bölümde App ID yanında bulunan anahtarı Live hale getirin.</li>"
				.Write "	</ol>"
				.Write "</p>"
			End With

			Call PluginPage("Footer")
			Call SystemTeardown("destroy")
		End If

		'--------------------------------------------------------
		' Main Page
		'--------------------------------------------------------
		With Response
			'------------------------------------------------------------------------------------------
				PLUGIN_PANEL_MASTER_HEADER This()
			'------------------------------------------------------------------------------------------
			.Write "<div class=""row"">"
			.Write "    <div class=""col-lg-12 col-sm-12"">"
			.Write 			QuickSettings("input", ""& PLUGIN_CODE &"_PIXEL_ID", "Piksel ID", "", TO_DB)
			.Write "    </div>"
			.Write "    <div class=""col-lg-12 col-sm-12"">"
			.Write 			QuickSettings("textarea", ""& PLUGIN_CODE &"_PIXEL_SCRIPT", "Piksel Script Template", "", TO_DB)
			.Write "    </div>"
			.Write "</div>"
			.Write "<div class=""row"">"
			.Write "    <div class=""col-lg-12 col-sm-12"">"
			.Write "        <a open-iframe href=""ajax.asp?Cmd=PluginSettings&PluginName="& PLUGIN_CODE &"&Page=SHOW:HowTo"" class=""btn btn-sm btn-primary"">"
			.Write "        	Piksel Script Template Nedir?"
			.Write "        </a>"
			.Write "        <a open-iframe href=""ajax.asp?Cmd=PluginSettings&PluginName="& PLUGIN_CODE &"&Page=SHOW:DefaultTriggers"" class=""btn btn-sm btn-primary"">"
			.Write "        	Varsayılan Tetikleyiciler"
			.Write "        </a>"
			.Write "    </div>"
			.Write "</div>"
		End With
	End Sub
	'---------------------------------------------------------------
	'
	'---------------------------------------------------------------

	'---------------------------------------------------------------
	'
	'---------------------------------------------------------------
	private sub class_initialize()
    	'-------------------------------------------------------------------------------------
    	' PluginTemplate Main Variables
    	'-------------------------------------------------------------------------------------
    	PLUGIN_NAME 			= "Meta Pixel Events Plugin"
    	PLUGIN_CODE  			= "METAPIXEL"
    	PLUGIN_DB_NAME 			= "metapixel_log" ' tbl_plugin_XXXXXXX
    	PLUGIN_VERSION 			= "1.0.0"
    	PLUGIN_CREDITS 			= "@badursun Anthony Burak DURSUN"
    	PLUGIN_GIT 				= "https://github.com/RabbitCMS-Hub/Meta-Pixel-Events-Plugin"
    	PLUGIN_DEV_URL 			= "https://adjans.com.tr"
    	PLUGIN_FOLDER_NAME 		= "Meta-Pixel-Events-Plugin"
    	PLUGIN_ICON 			= "zmdi-facebook"
    	PLUGIN_REMOVABLE 		= True
    	PLUGIN_AUTOLOAD 		= True
    	PLUGIN_ROOT 			= PLUGIN_DIST_FOLDER_PATH(This)
    	PLUGIN_FILES_ROOT 		= PLUGIN_VIRTUAL_FOLDER(This)
    	'-------------------------------------------------------------------------------------
    	' PluginTemplate Main Variables
    	'-------------------------------------------------------------------------------------
		q="<!-- Meta Pixel Code -->" & vbcrlf
		q=q+"<script>" & vbcrlf
		q=q+"  !function(f,b,e,v,n,t,s)" & vbcrlf
		q=q+"  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?" & vbcrlf
		q=q+"  n.callMethod.apply(n,arguments):n.queue.push(arguments)};" & vbcrlf
		q=q+"  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';" & vbcrlf
		q=q+"  n.queue=[];t=b.createElement(e);t.async=!0;" & vbcrlf
		q=q+"  t.src=v;s=b.getElementsByTagName(e)[0];" & vbcrlf
		q=q+"  s.parentNode.insertBefore(t,s)}(window, document,'script'," & vbcrlf
		q=q+"  'https://connect.facebook.net/en_US/fbevents.js');" & vbcrlf
		q=q+"  fbq('init', '{{SCRIPT_CODE}}');" & vbcrlf
		q=q+"  fbq('track', 'PageView');" & vbcrlf
		q=q+"  // fbq('track', 'ViewContent');" & vbcrlf
		q=q+"</script>" & vbcrlf
		q=q+"<noscript><img height=""1"" width=""1"" style=""display:none"" src=""https://www.facebook.com/tr?id={{SCRIPT_CODE}}&ev=PageView&noscript=1""/></noscript>" & vbcrlf
		q=q+"<!-- End Meta Pixel Code -->" & vbcrlf

		PIXEL_ID 				= GetSettings(""&PLUGIN_CODE&"_PIXEL_ID", "")
		PIXEL_SCRIPT_TEMPLATE 	= GetSettings(""&PLUGIN_CODE&"_PIXEL_SCRIPT", q)
    	'-------------------------------------------------------------------------------------
    	' PluginTemplate Register App
    	'-------------------------------------------------------------------------------------
    	class_register()

    	'-------------------------------------------------------------------------------------
    	' Hook Auto Load Plugin
    	'-------------------------------------------------------------------------------------
    	If PLUGIN_AUTOLOAD_AT("WEB") = True Then 
			Cms.HeaderData 	= Init()
			Cms.BodyData 	= ""
			Cms.FooterData 	= ""			
    	End If
	end sub
	'---------------------------------------------------------------
	'
	'---------------------------------------------------------------

	'---------------------------------------------------------------
	'
	'---------------------------------------------------------------
	Private sub class_terminate()

	End Sub
	'---------------------------------------------------------------
	'
	'---------------------------------------------------------------

	'---------------------------------------------------------------
	' Plugin Defines
	'---------------------------------------------------------------
	Public Property Get PluginCode() 		: PluginCode = PLUGIN_CODE 					: End Property
	Public Property Get PluginName() 		: PluginName = PLUGIN_NAME 					: End Property
	Public Property Get PluginVersion() 	: PluginVersion = PLUGIN_VERSION 			: End Property
	Public Property Get PluginGit() 		: PluginGit = PLUGIN_GIT 					: End Property
	Public Property Get PluginDevURL() 		: PluginDevURL = PLUGIN_DEV_URL 			: End Property
	Public Property Get PluginFolder() 		: PluginFolder = PLUGIN_FILES_ROOT 			: End Property
	Public Property Get PluginIcon() 		: PluginIcon = PLUGIN_ICON 					: End Property
	Public Property Get PluginRemovable() 	: PluginRemovable = PLUGIN_REMOVABLE 		: End Property
	Public Property Get PluginCredits() 	: PluginCredits = PLUGIN_CREDITS 			: End Property
	Public Property Get PluginRoot() 		: PluginRoot = PLUGIN_ROOT 					: End Property
	Public Property Get PluginFolderName() 	: PluginFolderName = PLUGIN_FOLDER_NAME 	: End Property
	Public Property Get PluginDBTable() 	: PluginDBTable = IIf(Len(PLUGIN_DB_NAME)>2, "tbl_plugin_"&PLUGIN_DB_NAME, "") 	: End Property
	Public Property Get PluginAutoload() 	: PluginAutoload = PLUGIN_AUTOLOAD 			: End Property

	Private Property Get This()
		This = Array(PluginCode, PluginName, PluginVersion, PluginGit, PluginDevURL, PluginFolder, PluginIcon, PluginRemovable, PluginCredits, PluginRoot, PluginFolderName, PluginDBTable, PluginAutoload)
	End Property
	'---------------------------------------------------------------
	' Plugin Defines
	'---------------------------------------------------------------

	Public Property Get Init()
		Init = ""

		If IsNumericalAndNotZero(PIXEL_ID) = False Then 
			Exit Property
		End If


		Init = Replace(PIXEL_SCRIPT_TEMPLATE, "{{SCRIPT_CODE}}", PIXEL_ID)

		PLUGIN_ADD_TO This, "JS", "js/meta.js"
	End Property

End Class 
%>
