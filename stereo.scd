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


exp(Complex(0,1)*0.degrad).round(0.0001)

(
{
var pos1,pos2,pos3,pos4;

pos1=MouseX.kr(1.neg,1).poll;
pos2=MouseX.kr(1.neg,1).neg;
pos3=MouseY.kr(1.neg,1).neg;
pos4=MouseY.kr(1.neg,1);

	Out.ar(0,Pan2.ar(PlayBuf.ar(1, ~c1.bufnum, BufRateScale.kr(~c1), loop: 0, doneAction:2),pos3));
	Out.ar(0,Pan2.ar(PlayBuf.ar(1, ~c2.bufnum, BufRateScale.kr(~c2), loop: 0, doneAction:2),pos4));
	Out.ar(0,Pan2.ar(PlayBuf.ar(1, ~c3.bufnum, BufRateScale.kr(~c3), loop: 0, doneAction:2),pos1));
	Out.ar(0,Pan2.ar(PlayBuf.ar(1, ~c4.bufnum, BufRateScale.kr(~c4), loop: 0, doneAction:2),pos2));
}.play;
)