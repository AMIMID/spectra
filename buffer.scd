
(
s.options.numWireBufs = 1024*16;
s.options.numOutputBusChannels=2;
s.options.numInputBusChannels=0;
TempoClock.default.tempo_(120/120);
s.options.memSize = 8192*64;
s.options.blockSize = 16;
s.options.maxLogins = 32;
s.waitForBoot
)


(
var i = Quaternion(0, (1/3).sqrt, 0, 0),j = Quaternion(0, 0, (1/3).sqrt, 0),k = Quaternion(0, 0, 0, (1/3).sqrt),q1,q2,v1,v2,v3,angle=0,ph1x,ph1y,ph1z,ph2x,ph2y,ph2z,ph3x,ph3y,ph3z;


10.do{
	angle=(angle+(137.5)).wrap(0,360);
 	q1=(cos(angle.degrad)+(sin(angle.degrad)*(i+j+k)));
	v1=Quaternion(0,1,2,3);
	v1=q1*v1;
 	//v1.coordinates.round(0.0001).postln;
	v1.b.postln;
	ph1x=Complex(v1.a.round(0.0001),v1.b.round(0.0001)).phase;
	ph1y=Complex(v1.a.round(0.0001),v1.c.round(0.0001)).phase;
	ph1z=Complex(v1.a.round(0.0001),v1.d.round(0.0001)).phase;
	//ph1x.postln;
	//ph1y.postln;
	//ph1z.postln;
 }

)
2.7713283734942
3.0323613723907
2.4481334285491

~c1 = Buffer.readChannel(s,"/Users/petrostatsiopoulos/Desktop/analogue dreams.wav",channels:0 );
(
(
SynthDef("help-phaseShift", { arg out=0;
        var in, chain;
        in = PlayBuf.ar(1, ~c1.bufnum, BufRateScale.kr(~c1), loop: 0);
        chain = FFT(LocalBuf(2048), in);
        chain = PV_PhaseShift(chain,0.degrad);
        Out.ar(out, 0.1 * IFFT(chain));
}).play(s);
);
(
SynthDef("help-phaseShift", { arg out=1;
        var in, chain;
        in = PlayBuf.ar(1, ~c1.bufnum, BufRateScale.kr(~c1), loop: 0);
        chain = FFT(LocalBuf(2048), in);
        chain = PV_PhaseShift(chain,90.degrad);
        Out.ar(out, 0.1 * IFFT(chain));
}).play(s);
);
(
SynthDef("help-phaseShift", { arg out=2;
        var in, chain;
        in = PlayBuf.ar(1, ~c1.bufnum, BufRateScale.kr(~c1), loop: 0);
        chain = FFT(LocalBuf(2048), in);
        chain = PV_PhaseShift(chain,2.4481334285491);
        Out.ar(out, 0.1 * IFFT(chain));
}).play(s);
);
)

s.record(numChannels:3)

(
~c1 = Buffer.readChannel(s,"/Users/petrostatsiopoulos/Music/SuperCollider Recordings/SC_240601_195507.wav",channels:0 );
~c2 = Buffer.readChannel(s,"/Users/petrostatsiopoulos/Music/SuperCollider Recordings/SC_240601_195507.wav",channels:1 );
~c3 = Buffer.readChannel(s,"/Users/petrostatsiopoulos/Music/SuperCollider Recordings/SC_240601_195507.wav",channels:1 );
)





(
{
    var in1,in2,in3, chainx,chainy,chainz,b=0,detune1,angle=0,sx,sy,sz,tx,ty,tz;
	var i = Quaternion(0, (1/3).sqrt, 0, 0),j = Quaternion(0, 0, (1/3).sqrt, 0),k = Quaternion(0, 0, 0, (1/3).sqrt),vp;
	var v,q,phx,phy,phz;
	var wrappedOut1 = { |busArray, signalArray|
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])}};
	var wrappedOut2 = { |busArray, signalArray|
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])}};
	var wrappedOut3 = { |busArray, signalArray|
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])}};

	var outx = NamedControl.kr(\out1, [0, 1,2,3]);  // multiple buses!
	var outy = NamedControl.kr(\out2, [4, 0,5,2]);
	var outz = NamedControl.kr(\out3, [4, 1,5,3]);

    in1 = PlayBuf.ar(1, ~c1.bufnum, BufRateScale.kr(~c1), loop: 0);
	 in2 = PlayBuf.ar(1, ~c2.bufnum, BufRateScale.kr(~c2), loop: 0);
	//in3 = PlayBuf.ar(1, ~c3.bufnum, BufRateScale.kr(~c3), loop: 0);
	vp=[1,2,3].normalizeSum;
	v=Quaternion(0,vp.[0].sqrt,vp.[1].sqrt,vp.[2].sqrt);

   250.do{

		chainx = FFT(LocalBuf(1024), in1);
		chainy = FFT(LocalBuf(1024), in2);
		chainz = FFT(LocalBuf(1024), in3);

		angle=((360-(360/1.6180339887499)));

		q=(cos(angle.degrad/2)+(sin(angle.degrad/2)*(i+j+k)));
		v=q*v*q.conjugate;

	phx=Complex(v.a.round(0.0001),v.b.round(0.0001)).phase;
	phy=Complex(v.a.round(0.0001),v.c.round(0.0001)).phase;
	phz=Complex(v.a.round(0.0001),v.d.round(0.0001)).phase;

		sx=exp(Complex(0,1)*phx).real;
		tx=exp(Complex(0,1)*phx).imag;
		sy=exp(Complex(0,1)*phy).real;
		ty=exp(Complex(0,1)*phy).imag;
		sz=exp(Complex(0,1)*phz).real;
		tz=exp(Complex(0,1)*phz).imag;

   chainx = chainx.pvcollect(1024, {|mag, phase, index| [mag, phase]; }, frombin: b, tobin: b, zeroothers: 1);

   chainy = chainy.pvcollect(1024, {|mag, phase, index| [mag, phase]; }, frombin: b, tobin: b, zeroothers: 1);

  // chainz = chainz.pvcollect(1024, {|mag, phase, index| [mag, phase]; }, frombin: b, tobin: b, zeroothers: 1);


	b=b+1;


		wrappedOut1.value(outx,Pan4.ar(LeakDC.ar(IFFT(chainx)),sx,tx));
		wrappedOut2.value(outy,Pan4.ar(LeakDC.ar(IFFT(chainy)),sy,ty));
	//	wrappedOut3.value(outz,Pan4.ar(LeakDC.ar(IFFT(chainz)),sz,tz));

	}
}.play
)


(
{
    var in1,in2,in3, chainx,chainy,chainz,b=0,detune1,angle=0,sx,sy,sz,tx,ty,tz;
	var i = Quaternion(0, (1/3).sqrt, 0, 0),j = Quaternion(0, 0, (1/3).sqrt, 0),k = Quaternion(0, 0, 0, (1/3).sqrt);
	var v,q,phx,phy,phz,vp;

    in1 = PlayBuf.ar(1, ~c1.bufnum, BufRateScale.kr(~c1), loop: 0);
	 in2 = PlayBuf.ar(1, ~c2.bufnum, BufRateScale.kr(~c2), loop: 0);
in3 = PlayBuf.ar(1, ~c3.bufnum, BufRateScale.kr(~c3), loop: 0);

	vp=[1,2,3].normalizeSum;
	v=Quaternion(0,vp.[0].sqrt,vp.[1].sqrt,vp.[2].sqrt);
	angle=((360-(360/1.6180339887499)));

   250.do{

		chainx = FFT(LocalBuf(1024), in1);
		chainy = FFT(LocalBuf(1024), in2);
	  chainz = FFT(LocalBuf(1024), in3);


		q=(cos(angle.degrad/2)+(sin(angle.degrad/2)*(i+j+k)));
		v=q*v*q.conjugate;

	//phx=Complex(v.a.round(0.0001),v.b.round(0.0001)).phase;
	//phy=Complex(v.a.round(0.0001),v.c.round(0.0001)).phase;
	//phz=Complex(v.a.round(0.0001),v.d.round(0.0001)).phase;

		//sx=exp(Complex(0,1)*phx).real;
		//tx=exp(Complex(0,1)*phx).imag;
		//sy=exp(Complex(0,1)*phy).real;
		//ty=exp(Complex(0,1)*phy).imag;
		//sz=exp(Complex(0,1)*phz).real;
		//tz=exp(Complex(0,1)*phz).imag;

   chainx = chainx.pvcollect(1024, {|mag, phase, index| [mag, phase]; }, frombin: b, tobin: b, zeroothers: 1);

   chainy = chainy.pvcollect(1024, {|mag, phase, index| [mag, phase]; }, frombin: b, tobin: b, zeroothers: 1);

   chainz = chainz.pvcollect(1024, {|mag, phase, index| [mag, phase]; }, frombin: b, tobin: b, zeroothers: 1);


	b=b+1;


Out.ar(0,Pan2.ar(LeakDC.ar(IFFT(chainx)),v.b));
Out.ar(0,Pan2.ar(LeakDC.ar(IFFT(chainy)),v.c));
Out.ar(0,Pan2.ar(LeakDC.ar(IFFT(chainz)),v.d));

	}
}.play
)


~c1 = Buffer.readChannel(s,"/Users/petrostatsiopoulos/Music/SuperCollider Recordings/SC_240603_090817.wav",channels:[0,1] );


(SynthDef.new(\oe, {
	var osc1;
	osc1=BBandPass.ar(PlayBuf.ar(2, ~c1.bufnum, BufRateScale.kr(~c1), loop: 0),600,MouseX.kr(0.0001,1,1),MouseX.kr(1000,1,1));
	Out.ar(0,LeakDC.ar(osc1));
}).add;)

Synth(\oe);
s.record;

(
~fftsize=8192;
~hop=0.25;
~win=0;
~f={Buffer.alloc(s,~c1.duration.calcPVRecSize(~fftsize,~hop))}!2;
)
(
{
	var sig,chain,localbuf;
	sig=PlayBuf.ar(2, ~c1.bufnum, BufRateScale.kr(~c1), loop: 0,doneAction:2);
	localbuf={LocalBuf.new(~fftsize)}!2;
	chain=FFT(localbuf,sig,~hop,~win);
	chain=PV_RecordBuf(chain,~f,run:1,hop:~hop,wintype:~win);
	0;
}.play;
)

(
x={
	var sig,chain,localbuf;
	localbuf={LocalBuf.new(~fftsize)}!2;
		chain=PV_PlayBuf(localbuf,~f,\rate.kr(1),loop:inf);
		sig=IFFT(chain,~win);
	}.play;
)

x.set(\rate,0);
x.set(\rate,1/10);
x.set(\rate,-2/3);
x.release(2);


