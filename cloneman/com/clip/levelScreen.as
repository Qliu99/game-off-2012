package com.clip
{
	import com.game.common.App;
	import com.game.common.Setting;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * @author Adhi
	 */
	public class levelScreen extends MovieClip 
	{
		public function levelScreen():void {
			this.addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		protected function onAdded(e:Event):void {
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
			for (var i:int = 1; i < Setting.maxLevel;i+=10){
				this["btn_level_"+i].addEventListener(MouseEvent.CLICK, onClicked);
			}
			this["btn_back"].addEventListener(MouseEvent.CLICK, onBack);
		}
		
		protected function onRemoved(e:Event):void {
			this.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
			this.removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			for (var i:int = 1; i < Setting.maxLevel;i+=10){
				this["btn_level_"+i].removeEventListener(MouseEvent.CLICK, onClicked);
			}
			this["btn_back"].removeEventListener(MouseEvent.CLICK, onBack);
		}

		protected function onClicked(e:MouseEvent):void {
			App.GetInstance().mSound.PlaySound("sendClone", this.name);
			var level:int = parseInt(e.currentTarget.name.split("_")[2]);
			App.GetInstance().mMain.EnterStage(level);
		}
		
		protected function onBack(e:MouseEvent):void {
			App.GetInstance().mSound.PlaySound("sendClone", this.name);
			App.GetInstance().mMain.ReturnToTitle(this);
		}
	}
	
}