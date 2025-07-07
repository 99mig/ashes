extends Node

#static var ActivePanel
static var ActiveScreen

## SCREENS

static func show_screen(ScreenName : String, ScreenData : Dictionary):
	if UI.Main.UIData.SCREENS_INDEX.has(ScreenName):
		if ActiveScreen:
			await hide_screen()
			
		var ScreenPath = UI.Main.UIData.SCREENS_INDEX[ScreenName]
		ActiveScreen = load(ScreenPath).instantiate()
		UI.Main.canvas.add_child(ActiveScreen)
		#ActiveScreen._set_screen_data(ScreenData)
		
	else:
		print("panel not found: ", ScreenName)

static func hide_screen() :
	if ActiveScreen:
		#await UI.Main.UIAnimator.animate_panel_out(ActiveScreen, 1.0)
		ActiveScreen.queue_free()
		ActiveScreen = null


### PANELS
#
#static func show_panel(PanelName : String, PanelData : Dictionary):
	#if UI.Main.UIData.PANELS_INDEX.has(PanelName):
		#if ActivePanel:
			#await hide_panel()
			#
		#var PanelPath = UI.UIData.PANELS_INDEX[PanelName]
		#ActivePanel = load(PanelPath).instantiate()
		##ActivePanel._set_panel_data(PanelData)
		#UI.Main.add_child(ActivePanel)
		#print("PANEL ANADIDO")
		#
	#else:
		#print("panel not found: ", PanelName)
#
#static func hide_panel() :
	#if ActivePanel:
		##await UI.Main.UIAnimator.animate_panel_out(ActivePanel, 1.0)
		#ActivePanel.queue_free()
		#ActivePanel = null
