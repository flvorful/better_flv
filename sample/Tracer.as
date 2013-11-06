﻿package{	import flash.display.*;	import flash.utils.*;		public class Tracer	{		public var trace_on:Boolean = true;		public function Tracer()		{		}		public function trace_array(message:String, arr:Array):void{			if (trace_on) {				trace(message);				for ( var i=0; i < arr.length; i++ ) {					trace(arr[i])				};				trace("");			}		}		public function turn_off():void{			trace_on = false;		}		public function trace_pretty(message:String):void{			if (trace_on) {				trace_line();				trace_new_line(message);				trace_line();			}		}		public function trace_pretty_describe_type(obj:*):void{			var description:XML = describeType(obj);      trace_pretty(description);		}		public function trace_line():void{			if (trace_on) {				trace("=========================================");			}		}		public function trace_new_line(message:String):void{			if (trace_on) {				trace(message);				trace("");			}		}		public function t(message:*):void{			if (trace_on) {				trace(message.toString());			}		}		public function trace_object(myObj:*):void {			if (trace_on) {				trace("Tracing Object");				for (var i in myObj) {					trace(i + ' = ' + myObj[i]);				}			}		}		public function trace_display_children(container:*, l:Number = 0):void{						if (trace_on) {				if (l == 0) {					trace_pretty("Tracing Children for: " + container.name)				}								try{					for ( var i=0; i < container.numChildren; i++ ) {						var thisChild = container.getChildAt(i)						var tr_out = "";						for ( var j=0; j < l; j++ ) {							tr_out += "  ";						}						tr_out += i + " " + thisChild.toString() + ": " + thisChild.name + " | Level: " + l;						trace(tr_out);						if (thisChild is DisplayObjectContainer) {							trace_display_children(thisChild, i + 1);						}					};				}				catch(error){					this.trace_pretty(error)				}			}		}		public function trace_array_objects(message:String, arr:Array):void {			if (trace_on) {				trace(message);				for ( var i=0; i < arr.length; i++ ) {					trace_object(arr[i])				};				trace("");			}		}		public function getChildByNameRec(container:*, obj_name:String):*{			if (trace_on) {				for ( var i=0; i < container.numChildren; i++ ) {					var thisChild = container.getChildByName(obj_name)					if (thisChild != undefined) {						return thisChild					}					else if (container.getChildAt(i) is DisplayObjectContainer) {						getChildByNameRec(container.getChildAt(i), obj_name);					};				}			}		}				public function find_by_instance_name(obj_name:String, container:*, l:Number = 0):*{			if (trace_on) {				try{					for ( var i=0; i < container.numChildren; i++ ) {						var thisChild = container.getChildAt(i)						var tr_out = "";						for ( var j=0; j < l; j++ ) {							tr_out += "  ";						}						tr_out += i + " " + thisChild.toString() + ": " + thisChild.name + " | Level: " + l;						trace(tr_out);						if (thisChild is DisplayObjectContainer) {							trace_display_children(thisChild, i + 1);						}					};				}				catch(error){					this.trace_pretty(error)				}			}		}		public function find_object(obj_name:String, container:*):*{			for ( var i=0; i < container.numChildren; i++ ) {				var thisChild = container.getChildAt(i)				if (thisChild.name == obj_name){					return thisChild				};			};		}		public function convert_time(duration:Number):String{			var minutes2 = Math.floor(duration / 60);			var seconds2 = Math.floor(duration % 60);			if (seconds2 < 10) {				seconds2 = "0" + seconds2;			}			if (minutes2 < 10) {				minutes2 = "0" + minutes2;			}						return minutes2 + ":" + seconds2;		}	}}