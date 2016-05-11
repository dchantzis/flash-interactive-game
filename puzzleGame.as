package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import fl.events.SliderEvent;
	import flash.display.SimpleButton;
	import dragNdrop;
	
	import G01PP01;
	import G01PP02;
	import G01PP03;
	import G01PP04;
	import G01PP05;
	import G01PP06;
	import G01PP07;
	import G01PP08;
	import G01PP09;
	import G01PP10;
	
	import G02PP01;
	import G02PP02;
	import G02PP03;
	import G02PP04;
	import G02PP05;
	import G02PP06;
	import G02PP07;
	import G02PP08;
	import G02PP09;
	import G02PP10;
	import G02PP11;
	import G02PP12;
	import G02PP13;
	import G02PP14;
	import G02PP15;
	import G02PP16;
	import G02PP17;
	import G02PP18;
	import G02PP19;
	import G02PP20;
	import G02PP21;
	import G02PP22;
	import G02PP23;
	import G02PP24;
	
	import G01FULL_SMALL;
	import G02FULL_SMALL;
	
	public class puzzleGame extends MovieClip
	{
		private var g01pp01:G01PP01 = new G01PP01();
		private var g01pp02:G01PP02 = new G01PP02();
		private var g01pp03:G01PP03 = new G01PP03();
		private var g01pp04:G01PP04 = new G01PP04();
		private var g01pp05:G01PP05 = new G01PP05();
		private var g01pp06:G01PP06 = new G01PP06();
		private var g01pp07:G01PP07 = new G01PP07();
		private var g01pp08:G01PP08 = new G01PP08();
		private var g01pp09:G01PP09 = new G01PP09();
		private var g01pp10:G01PP10 = new G01PP10();

		private var g02pp01:G02PP01 = new G02PP01();
		private var g02pp02:G02PP02 = new G02PP02();
		private var g02pp03:G02PP03 = new G02PP03();
		private var g02pp04:G02PP04 = new G02PP04();
		private var g02pp05:G02PP05 = new G02PP05();
		private var g02pp06:G02PP06 = new G02PP06();
		private var g02pp07:G02PP07 = new G02PP07();
		private var g02pp08:G02PP08 = new G02PP08();
		private var g02pp09:G02PP09 = new G02PP09();
		private var g02pp10:G02PP10 = new G02PP10();
		private var g02pp11:G02PP11 = new G02PP11();
		private var g02pp12:G02PP12 = new G02PP12();
		private var g02pp13:G02PP13 = new G02PP13();
		private var g02pp14:G02PP14 = new G02PP14();
		private var g02pp15:G02PP15 = new G02PP15();
		private var g02pp16:G02PP16 = new G02PP16();
		private var g02pp17:G02PP17 = new G02PP17();
		private var g02pp18:G02PP18 = new G02PP18();
		private var g02pp19:G02PP19 = new G02PP19();
		private var g02pp20:G02PP20 = new G02PP20();
		private var g02pp21:G02PP21 = new G02PP21();
		private var g02pp22:G02PP22 = new G02PP22();
		private var g02pp23:G02PP23 = new G02PP23();
		private var g02pp24:G02PP24 = new G02PP24();

		private var g01full_small_btn:G01FULL_SMALL = new G01FULL_SMALL();
		private var g02full_small_btn:G02FULL_SMALL = new G02FULL_SMALL();

		private var enableDragNDrop = new dragNdrop();

		private var _totalPPnumG01:Number;
		private var _totalPPnumG02:Number;
		private var _tempTotalPPnum:Number;
		private var _currentGame:Number;
		private var _destroiedPiecesG01:Boolean;
		private var _destroiedPiecesG02:Boolean;
		
		private var _currentCorrectPPnum:Number;
		private var _puzzleCompleted:Boolean;
		private var _gamePlayedNum:Number;
		
		private var pzlBoarderLines:Array;
		
		
		//Game 01 variables
		private var pzlPiecesArrG01:Array;
		private var pzlPiecesArrG01TargetPosElement:Array;
		private var helpHandVlinesArrG01:Array;
		private var inkStainsBArrG01:Array;

		//Game 02 variables
		private var pzlPiecesArrG02:Array;
		private var pzlPiecesArrG02TargetPosElement:Array;
		private var helpHandVlinesArrG02:Array;
		private var inkStainsBArrG02:Array;
		
		public function puzzleGame()
		{
			pzlBoarderLines = [horizontalLine01_mc,horizontalLine04_mc,verticalLine01_mc,verticalLine06_mc]
			helpHandVlinesArrG01 = [horizontalLine02_mc,horizontalLine03_mc,verticalLine02_mc,verticalLine03_mc,verticalLine04_mc,verticalLine05_mc];
			inkStainsBArrG01 = [inks01B_mc,inks02B_mc,inks03B_mc,inks04B_mc,inks05B_mc,inks06B_mc,inks07B_mc,inks08B_mc,inks09B_mc,inks10B_mc];
			helpHandVlinesArrG02 = [vG02Line01_mc,vG02Line02_mc,vG02Line03_mc,hG02Line01_mc,hG02Line02_mc,hG02Line03_mc,hG02Line04_mc,hG02Line05_mc];
			inkStainsBArrG02 = [inks01B_mc,inks02B_mc,inks03B_mc,inks04B_mc,inks05B_mc,inks06B_mc,inks07B_mc,inks08B_mc,inks09B_mc,inks10B_mc];

			addChild(g01full_small_btn);
			addChild(g02full_small_btn);
			
			resetNaviButtons(1);
			
			resetGame01Elements(0);
			resetGame02Elements(0);
			g01full_small_btn.addEventListener(MouseEvent.MOUSE_DOWN, initGame01Elements);
			g02full_small_btn.addEventListener(MouseEvent.MOUSE_DOWN, initGame02Elements);
			navi_btn.addEventListener(MouseEvent.MOUSE_DOWN, goHome);
		}//constructor
		
		private function resetNaviButtons(alphaValue:Number):void
		{
			if(alphaValue==1)
			{
				g01full_small_btn.x = 112.3;
				g01full_small_btn.y = 49.4;
				g02full_small_btn.x = 362.3;
				g02full_small_btn.y = 237.2;
			}//if
			else
			{
				g01full_small_btn.x = 2000;
				g02full_small_btn.x = 2000;
			}//else
		}//setInitPositionNaviButtons():void
		
		private function hideNaviButtons():void
		{
			g01full_small_btn.x = 2000;
			g02full_small_btn.x = 2000;
		}//deactivateNaviButtons():void
		
		private function resetGame01Elements(alphaValue:Number):void
		{
			resetHelpLinesG01(alphaValue);
			resetBorderLines(alphaValue);
			helpSliderG01_mc.alpha = alphaValue;
			resetInkStainsG01();
		}//showGame01Elements():void
		
		private function resetHelpLinesG01(alphaValue:Number):void
		{
			for(var i:Number=0; i<helpHandVlinesArrG01.length; i++)
				{helpHandVlinesArrG01[i].alpha=alphaValue;}
		}//resetHelpLinesG01():void
		
		private function resetInkStainsG01():void
		{
			for(var i:Number=0; i<inkStainsBArrG01.length; i++)
				{inkStainsBArrG01[i].alpha = 0;}
		}//resetInkStainsG01():void
		
		private function resetBorderLines(alphaValue:Number):void
		{
			for(var i:Number=0; i<pzlBoarderLines.length; i++)
				{pzlBoarderLines[i].alpha = alphaValue;}
		}//resetBorderLines(alphaValue:Number):void




		private function resetGame02Elements(alphaValue:Number):void
		{
			resetHelpLinesG02(alphaValue);
			resetBorderLines(alphaValue);
			helpSliderG02_mc.alpha = alphaValue;
			resetInkStainsG01();
		}//showGame02Elements():void
		
		private function resetHelpLinesG02(alphaValue:Number):void
		{
			for(var i:Number=0; i<helpHandVlinesArrG02.length; i++)
				{helpHandVlinesArrG02[i].alpha=alphaValue;}
		}//resetHelpLinesG02():void

		private function initGame01Elements(event:MouseEvent):void
		{
			resetGame01Elements(1);
			resetNaviButtons(0);

			_currentGame = 1;
			
			//Game 01 variables
			pzlPiecesArrG01 = [g01pp01,g01pp02,g01pp03,g01pp04,g01pp05,g01pp06,g01pp07,g01pp08,g01pp09,g01pp10];
			pzlPiecesArrG01TargetPosElement = [g01pp01T_mc,g01pp02T_mc,g01pp03T_mc,g01pp04T_mc,g01pp05T_mc,g01pp06T_mc,g01pp07T_mc,g01pp08T_mc,g01pp09T_mc,g01pp10T_mc];
			
			_totalPPnumG01 = 10; //total number of puzzle pieces G01
			
			_currentCorrectPPnum = 0; //current number of places puzzle pieces
			_puzzleCompleted = false;
			_gamePlayedNum = 0;
			
			//create the puzzle pieces and place them on stage
			createPieces(pzlPiecesArrG01,pzlPiecesArrG01TargetPosElement);
			helpSliderG01_mc.addEventListener(SliderEvent.CHANGE, puzzleHelpG01);
		}//
		
		private function initGame02Elements(event:MouseEvent):void
		{
			resetGame02Elements(1);
			resetNaviButtons(0);
			
			_currentGame = 2;
			
			//Game 02 variables
			pzlPiecesArrG02 = [g02pp01,g02pp02,g02pp03,g02pp04,g02pp05,g02pp06,g02pp07,g02pp08,g02pp09,g02pp10,g02pp11,g02pp12,g02pp13,g02pp14,g02pp15,g02pp16,g02pp17,g02pp18,g02pp19,g02pp20,g02pp21,g02pp22,g02pp23,g02pp24];
			pzlPiecesArrG02TargetPosElement = [g02pp01T_mc,g02pp02T_mc,g02pp03T_mc,g02pp04T_mc,g02pp05T_mc,g02pp06T_mc,g02pp07T_mc,g02pp08T_mc,g02pp09T_mc,g02pp10T_mc,g02pp11T_mc,g02pp12T_mc,g02pp13T_mc,g02pp14T_mc,g02pp15T_mc,g02pp16T_mc,g02pp17T_mc,g02pp18T_mc,g02pp19T_mc,g02pp20T_mc,g02pp21T_mc,g02pp22T_mc,g02pp23T_mc,g02pp24T_mc];
			
			_totalPPnumG02 = 24; //total number of puzzle pieces G02
			
			_currentCorrectPPnum = 0; //current number of places puzzle pieces
			_puzzleCompleted = false;
			_gamePlayedNum = 0;
			
			//create the puzzle pieces and place them on stage
			createPieces(pzlPiecesArrG02,pzlPiecesArrG02TargetPosElement);
			helpSliderG02_mc.addEventListener(SliderEvent.CHANGE, puzzleHelpG02);
		}//
		
		private function puzzleHelpG01(event:SliderEvent):void
		{
			for(var i:Number=0; i<pzlPiecesArrG01TargetPosElement.length; i++)
			{
				pzlPiecesArrG01TargetPosElement[i].alpha = event.target.value/10-0.4;
			}//for
		}//puzzleHelpG01()
		
		private function puzzleHelpG02(event:SliderEvent):void
		{
			for(var i:Number=0; i<pzlPiecesArrG02TargetPosElement.length; i++)
			{
				pzlPiecesArrG02TargetPosElement[i].alpha = event.target.value/10-0.4;
			}//for
		}//puzzleHelpG02()
		
		private function createPieces(piecesArr:Array,targetPiecesArr):void
		{
			var piece:*;
			var targetPos:*;
			for(var i:Number=0; i<piecesArr.length; i++)
			{
				piece = piecesArr[i];
				targetPos = targetPiecesArr[i];
				addChild(piece);
				if(_gamePlayedNum==0){piece.enable();}
				piece._targetPiece = targetPos;
				piece.addEventListener(MouseEvent.MOUSE_UP, checkTarget);
				randomStartPosition(piece);
				piece.alpha = .75;
			}
		}//createPieces(piece:*,targetPos:*):void
		
		private function destroyPieces(pzlPiecesArr:Array):void
		{
			for(var i:Number=0; i<pzlPiecesArr.length; i++)
				{removeChild(pzlPiecesArr[i]);}
		}//destroyPieces():void
		
		private function checkTarget(event:MouseEvent):void
		{
			if(event.currentTarget.hitTestObject(event.currentTarget._targetPiece))
			{
				event.currentTarget.x = event.currentTarget._targetPiece.x;
				event.currentTarget.y = event.currentTarget._targetPiece.y;
				event.currentTarget.removeEventListener(MouseEvent.MOUSE_UP, checkTarget);
				event.currentTarget.disable();
				
				if(_currentGame==1){inkStainsBArrG01[_currentCorrectPPnum].alpha = 1;}
				else if(_currentGame==2){if(_currentCorrectPPnum < 10){inkStainsBArrG02[_currentCorrectPPnum].alpha = 1;}}
				
				_currentCorrectPPnum ++;
				
				//if puzzle completed
				
				if(_currentGame==1){_tempTotalPPnum = _totalPPnumG01;}
				else if(_currentGame==2){_tempTotalPPnum = _totalPPnumG02;}
					
				if(_currentCorrectPPnum >= _tempTotalPPnum)
				{
					inkStainButton_btn.alpha = 1;
					inkStainButton_btn.addEventListener(MouseEvent.MOUSE_DOWN, resultVideoPlayback);
					//hide all helping lines

					if(_currentGame==1){resetHelpLinesG01(0);}
					else if(_currentGame==2){resetHelpLinesG02(0);}
					
					_puzzleCompleted = true;
				}//if
			}//if
			else
			{
				event.currentTarget.x = event.currentTarget._originalX;
				event.currentTarget.y = event.currentTarget._originalY;
			}//else
		}//checkTarget(event:MouseEvent):void
		
		private function randomStartPosition(piece:*):void
		{
			piece.x = Math.round(Math.random() * (245 -piece.width));
			piece.y = Math.round(Math.random() * (200 - piece.height));
			piece._originalX = piece.x; piece._originalY = piece.y;
		}//randomStartPosition(piece:*):void
		
		//reset the game
		private function goHome(event:MouseEvent):void
			{resetGame();}//goHome(event:MouseEvent):void
		
		private function resetGame():void
		{
			//reset the game
			inkStainButton_btn.alpha = 0; 
			gotoAndStop(1); 
			_puzzleCompleted=false;
			_currentCorrectPPnum = 0;
			if(_currentGame==1)
			{
				resetGame01Elements(0);
				helpSliderG01_mc.alpha = 0;
				if(!_destroiedPiecesG01){destroyPieces(pzlPiecesArrG01);}
			}
			else if(_currentGame==2)
			{
				resetGame02Elements(0);
				helpSliderG02_mc.alpha = 0;
				if(!_destroiedPiecesG02){destroyPieces(pzlPiecesArrG02);}
			}
			resetNaviButtons(1);
		}//resetGame():void
		
		private function resultVideoPlayback(event:MouseEvent):void
		{
			//check if the puzzle is completed
			if(_puzzleCompleted)
			{
				if(currentFrame == 2 || currentFrame == 11)
				{
					if(_currentGame==1){_destroiedPiecesG01 = false;}
					else if(_currentGame==2){_destroiedPiecesG01 = false;}
					resetGame();
				}//if
				else
				{
					if(_currentGame==1){gotoAndStop(2);}
					else if(_currentGame==2){gotoAndStop(11);}
					
					if(_currentGame==1)
					{
						helpSliderG01_mc.alpha = 0;
						destroyPieces(pzlPiecesArrG01);
						_destroiedPiecesG01 = true;
					}//if
					else if(_currentGame==2)
					{
						helpSliderG02_mc.alpha = 0;
						destroyPieces(pzlPiecesArrG02);
						_destroiedPiecesG02 = true;
					}//else if
				}//else
			}//if
		}//
	}
}