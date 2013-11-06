﻿// BetterFLV: Skin.as// Author: Jake Varghese// Company: FLVorful// (C) 2007// Released under GPLv2package{	import flash.display.MovieClip;	import fl.video.VideoEvent;	import flash.system.LoaderContext;	import flash.display.*;	import flash.events.MouseEvent;	import flash.events.*;	import flash.net.*;	import flash.net.URLRequest;	import Tracer;	import BetterFLV;	public class Skin extends MovieClip	{		private var skin_url:String = ""		public var ldr:Loader = new Loader();		public var skin_content:MovieClip = new MovieClip();		public var tracer:Tracer = new Tracer();				/*** BUTTONS ***/		//regular buttons		public var play_button:SimpleButton;		public var pause_button:SimpleButton;		public var stop_button:SimpleButton;		public var embed_code_button:SimpleButton;		public var full_screen_button:SimpleButton;						// volume buttons		public var volume_medium_button:SimpleButton;		public var volume_full_button:SimpleButton;		public var volume_low_button:SimpleButton;		public var volume_mute_button:SimpleButton;				// misc clips		public var skin_background:MovieClip;		public var buffering_bar_filled:MovieClip;		public var buffering_bar_loading:MovieClip;		public var buffering_bar:MovieClip;		public var seek_handle:MovieClip;		public var timer_display:MovieClip;								//the flv player that this skin is attached to.		public var the_player:BetterFLV;		public function Skin(url:String = "", player:BetterFLV = null)		{			this.name = "new_skin"			this.visible = true			this.x = 0			this.y = 0			the_player = player			skin_url = url			if (skin_url != ""){				var urlReq:URLRequest = new URLRequest(skin_url)				ldr.load(urlReq)				ldr.contentLoaderInfo.addEventListener( Event.COMPLETE, skin_load_complete )			}					}		public function skin_load_complete( event:Event ):void		{			skin_content = MovieClip( ldr.content )			load_buttons();			addChild(skin_content);			dispatchEvent(new VideoEvent("skinLoaded"))		}								// private methods		private function load_buttons():void{			//tracer.trace_display_children(skin_content)			this.skin_background = MovieClip(skin_content.getChildByName("skin_background"))			this.full_screen_button = SimpleButton(skin_content.getChildByName("full_screen_button"))			this.embed_code_button = SimpleButton(skin_content.getChildByName("embed_code_button"))			this.stop_button = SimpleButton(skin_content.getChildByName("stop_button"))			this.play_button = SimpleButton(skin_content.getChildByName("play_button"))			this.pause_button = SimpleButton(skin_content.getChildByName("pause_button"))			this.buffering_bar_filled = MovieClip(skin_content.getChildByName("buffering_bar_filled"));			this.buffering_bar_loading = MovieClip(skin_content.getChildByName("buffering_bar_loading"));			this.buffering_bar = MovieClip(skin_content.getChildByName("buffering_bar"));			this.seek_handle = MovieClip(skin_content.getChildByName("seek_handle"));			this.volume_medium_button = SimpleButton(skin_content.getChildByName("volume_medium_button"));			this.volume_full_button = SimpleButton(skin_content.getChildByName("volume_full_button"));			this.volume_low_button = SimpleButton(skin_content.getChildByName("volume_low_button"));			this.volume_mute_button = SimpleButton(skin_content.getChildByName("volume_mute_button"));			this.timer_display = MovieClip(skin_content.getChildByName("timer_display"))						//this.buffering_bar_loading.width = 0			if (this.buffering_bar_filled){				this.buffering_bar_filled.width = 0				this.buffering_bar_filled.buttonMode = true			}			if (this.seek_handle){				this.seek_handle.buttonMode = true			}									// setting click handlers for buttons			if (this.embed_code_button){				this.embed_code_button.addEventListener(MouseEvent.CLICK, the_player.embed_code_button_clicked)			}						if (this.play_button){				this.play_button.addEventListener(MouseEvent.CLICK, the_player.play_button_clicked)			}						if (this.pause_button){				this.pause_button.addEventListener(MouseEvent.CLICK, the_player.pause_button_clicked)			}						if (this.stop_button){				this.stop_button.addEventListener(MouseEvent.CLICK, the_player.stop_button_clicked)			}						if (this.full_screen_button){				this.full_screen_button.addEventListener(MouseEvent.CLICK, the_player.full_screen_button_clicked)			}						if (this.volume_medium_button){				this.volume_medium_button.addEventListener(MouseEvent.CLICK, the_player.volume_medium_button_clicked)			}						if (this.volume_full_button){				this.volume_full_button.addEventListener(MouseEvent.CLICK, the_player.volume_full_button_clicked)			}						if (this.volume_low_button){				this.volume_low_button.addEventListener(MouseEvent.CLICK, the_player.volume_low_button_clicked)			}						if (this.volume_mute_button){				this.volume_mute_button.addEventListener(MouseEvent.CLICK, the_player.volume_mute_button_clicked)			}						if (this.buffering_bar_filled){				this.buffering_bar_filled.addEventListener(MouseEvent.CLICK, the_player.buffering_bar_clicked)			}								}	}}