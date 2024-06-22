(
s.options.numWireBufs = 1024*16;
s.options.numOutputBusChannels=2;
s.options.numInputBusChannels=0;
TempoClock.default.tempo_(120/120);
s.options.memSize = 8192*64;
//s.options.blockSize = 64/4;
s.options.maxNodes = 1024 * 64;
s.waitForBoot
)


(
~c1 = Buffer.readChannel(s,"/Users/petrostatsiopoulos/Music/SuperCollider Recordings/SC_240613_215715.wav",channels:0 );
~c2 = Buffer.readChannel(s,"/Users/petrostatsiopoulos/Music/SuperCollider Recordings/SC_240613_215715.wav",channels:1 );
~c3 = Buffer.readChannel(s,"/Users/petrostatsiopoulos/Music/SuperCollider Recordings/SC_240613_215715.wav",channels:2 );
~c4 = Buffer.readChannel(s,"/Users/petrostatsiopoulos/Music/SuperCollider Recordings/SC_240613_215715.wav",channels:3 );
)
-1.exp

exp(Complex(0,1)*0.degrad).round(0.0001)

(
{
var pos1,pos2,pos3,pos4,amp1,amp2,amp3,amp4;

pos1=MouseX.kr(1.neg,1);
pos2=MouseX.kr(1.neg,1).neg;
pos3=MouseY.kr(1.neg,1).neg;
pos4=MouseY.kr(1.neg,1);

	Out.ar(0,Pan2.ar(PlayBuf.ar(1, ~c1.bufnum, BufRateScale.kr(~c1), loop: 0, doneAction:2),pos3));
	Out.ar(0,Pan2.ar(PlayBuf.ar(1, ~c2.bufnum, BufRateScale.kr(~c2), loop: 0, doneAction:2),pos4));
	Out.ar(0,Pan2.ar(PlayBuf.ar(1, ~c3.bufnum, BufRateScale.kr(~c3), loop: 0, doneAction:2),pos1));
	Out.ar(0,Pan2.ar(PlayBuf.ar(1, ~c4.bufnum, BufRateScale.kr(~c4), loop: 0, doneAction:2),pos2));
}.play;
)

(
(
a={
	arg /*posx,posy,*/amp;
	var pos1,pos2,pos3,pos4,amp1,amp2,amp3,amp4;

pos1=MouseX.kr(1.neg,1);
pos2=MouseX.kr(1.neg,1).neg;
pos3=MouseY.kr(1.neg,1).neg;
pos4=MouseY.kr(1.neg,1);

	Out.ar(0,Pan2.ar(PlayBuf.ar(1, ~c1.bufnum, BufRateScale.kr(~c1), loop: 0, doneAction:2),pos3,amp));
	Out.ar(0,Pan2.ar(PlayBuf.ar(1, ~c2.bufnum, BufRateScale.kr(~c2), loop: 0, doneAction:2),pos4,amp));
	Out.ar(0,Pan2.ar(PlayBuf.ar(1, ~c3.bufnum, BufRateScale.kr(~c3), loop: 0, doneAction:2),pos1,amp));
	Out.ar(0,Pan2.ar(PlayBuf.ar(1, ~c4.bufnum, BufRateScale.kr(~c4), loop: 0, doneAction:2),pos2,amp));
}.play;
);

Window.closeAll;
////////////////////////////////////////////////////////////////////////////////////////////////window
w = Window("Nest", Rect(100,10,300,300))
.front
.alwaysOnTop_(true);

				Slider2D(w, Rect(190,205,100,185))
				.background_(Color.rand)
	.x_(0)
	.y_(0)
	.action_({
		arg obj;
		var gg, cg, ff;

		cg = obj.y.linlin(0,1,1.neg,1);
		ff = obj.x.linlin(0,1,1.neg,1);
		gg = [cg, ff];
		gg.postln;
	a.set(\posx,ff,\posy,cg);
});


				Slider(w, Rect(120,115,65,10))
				.background_(Color.rand)
	.action_({
	arg obj;
	var cf;
	cf = obj.value.linexp(0,1,0.01,1).postln;
		a.set(\amp,cf);
	})

)

