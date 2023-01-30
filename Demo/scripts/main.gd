extends Node2D

onready var yodo1mas = $Yodo1Mas
onready var privacyController = $PrivacyController
onready var privacyPopup: PopupDialog = $CanvasLayer/PdPrivacy
onready var debug_out = $CanvasLayer/Orange/DebugOut
onready var coins_label: Label = $CanvasLayer/Orange/Coins_Background/Coins
onready var IsPrivacyDialogEnabled = $Yodo1Mas.IsPrivacyEnabled
onready var IsAppOpenAdsEnabled = $Yodo1Mas.IsAppOpenAdsRequired
onready var AndroidAppKey = $Yodo1Mas.app_id_android
var coins = 0

func _ready():
	#privacyController.init()
	#privacyPopup.init()
	yodo1mas.init()
	print(coins_label.text)

func add_coins(add: int):
	coins += add
	coins_label.text = str(coins)


func _on_PrivacyController_ended():
	yodo1mas.init()

# buttons callbacks
	
func _on_BtnBannerAd_pressed():
	
	yodo1mas.load_banner_ad("Banner","RIGHT","TOP")
	yodo1mas.load_appopen_ad()

func _on_BtnInterstitialAd_pressed() -> void:
	#debug_out.text = debug_out.text + "Interstitial loaded before shown = " + str(yodo1mas.is_interstitial_ad_loaded()) +"\n"
	yodo1mas.show_interstitial_ad()
	#debug_out.text = debug_out.text + "Interstitial loaded after shown = " + str(yodo1mas.is_interstitial_ad_loaded()) +"\n"
	
func _on_RewardedAd_pressed() -> void:
	#debug_out.text = debug_out.text + "Rewarded video loaded before shown = " + str(yodo1mas.is_rewarded_ad_loaded()) +"\n"
	yodo1mas.initialize_rewarded_ad()
	yodo1mas.load_rewarded_ad()
	yodo1mas.show_rewarded_ad()
	
	#debug_out.text = debug_out.text + "Rewarded video loaded after shown = " + str(yodo1mas.is_rewarded_ad_loaded()) + "\n"

func _on_BtnPrivacy_pressed():
	privacyPopup.popup()
	
	
# callbacks	from signals

func _on_Yodo1Mas_banner_ad_loaded():
	debug_out.text = debug_out.text + "Banner loaded\n"
	
func _on_Yodo1Mas_banner_failed_ad_loaded():
	debug_out.text = debug_out.text + "Banner not loaded\n"
func _on_Yodo1Mas_banner_ad_opened():
	#add_coins(5)
	debug_out.text = debug_out.text + "Banner opened\n"

func _on_Yodo1Mas_banner_ad_failed_opened():
	#add_coins(5)
	debug_out.text = debug_out.text + "Banner not opened\n"

func _on_Yodo1Mas_banner_ad_closed():
	debug_out.text = debug_out.text + "Banner closed\n"




func _on_Yodo1Mas_interstitial_ad_loaded():
	debug_out.text = debug_out.text + "Interstitial  loaded\n"
	
func _on_Yodo1Mas_interstitial_ad_not_loaded():
	yodo1mas.load_interstitial_ads()
	debug_out.text = debug_out.text + "Interstitial not loaded\n"

func _on_Yodo1Mas_interstitial_ad_opened():
	debug_out.text = debug_out.text + "Interstitial opened\n"
	
func _on_Yodo1Mas_interstitial_ad_failed_to_opened():
	yodo1mas.load_interstitial_ads()
	debug_out.text = debug_out.text + "Interstitial not opened\n"

func _on_Yodo1Mas_interstitial_ad_closed():
	yodo1mas.load_interstitial_ads()
	add_coins(10)
	debug_out.text = debug_out.text + "Interstitial closed\n"



func _on_Yodo1Mas_rewarded_ad_loaded():
	debug_out.text = debug_out.text + "Rewarded video  loaded\n"
	
func _on_Yodo1Mas_rewarded_ad_not_loaded():
	yodo1mas.load_rewarded_ad()
	debug_out.text = debug_out.text + "Rewarded video not loaded\n"
	
func _on_Yodo1Mas_rewarded_ad_opened():
	debug_out.text = debug_out.text + "Rewarded video opened\n"
	
func _on_Yodo1Mas_rewarded_ad_failed_opened():
	yodo1mas.load_rewarded_ad()
	debug_out.text = debug_out.text + "Rewarded video not opened\n"
func _on_Yodo1Mas_rewarded_ad_closed():
	yodo1mas.load_rewarded_ad()
	debug_out.text = debug_out.text + "Rewarded video closed\n"

func _on_Yodo1Mas_rewarded_ad_earned():
	add_coins(15)
	debug_out.text = debug_out.text + "Rewarded video earned\n"
