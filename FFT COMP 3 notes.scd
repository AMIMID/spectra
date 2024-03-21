{SinOsc.ar(0.1,mul:360).poll}.play
(
s.options.numWireBufs = 1024*16;
s.options.numOutputBusChannels=4;
s.options.numInputBusChannels=0;
TempoClock.default.tempo_(120/120);
s.options.memSize = 8192*16;
s.waitForBoot
)

(
{Out.ar(0,PanAz.ar(2,SinOsc.ar(220,SinOsc.ar(0.0220,0.degrad,360).degrad),SinOsc.ar(0.220,0.degrad)))}.play;
{Out.ar(0,PanAz.ar(2,SinOsc.ar(220,SinOsc.ar(0.0220,90.degrad,360).degrad),SinOsc.ar(0.220,90.degrad)))}.play;
)
(
{Out.ar(0,PanAz.ar(2,SinOsc.ar(220,0.degrad),LFSaw.ar(0.1,0)))}.play;
{Out.ar(0,PanAz.ar(2,SinOsc.ar(220,90.degrad),LFSaw.ar(0.1,1)))}.play;
)

(
{Out.ar(0,SinOsc.ar(100,LFSaw.kr(0.022,0,2pi)))}.play;
{Out.ar(1,SinOsc.ar(100,LFSaw.kr(0.022,0.5,2pi)))}.play;
)

//
(
{Out.ar(0,SinOsc.ar(220,SinOsc.kr(0.022,SinOsc.kr(0.022,0.degrad,360).abs.degrad,360).abs.degrad))}.play;
{Out.ar(1,SinOsc.ar(220,SinOsc.kr(0.022,SinOsc.kr(0.022,90.degrad,360).abs.degrad,360).abs.degrad))}.play;
)

{WhiteNoise.ar(1).abs.poll}.play

{Out.ar(0,Pan2.ar(SinOsc.ar(220),SinOsc.ar(0.1,180.degrad)))}.play;


exp(Complex(0,1)*0.degrad).real.linlin(1.neg,1,360.neg,360)



(
{
var freqs, audiox,audioy,audioj,audiok, amp, m=0, fund=100, phasex,phasey,phasej,phasek,anglex=0,angley=0,anglej=90,anglek=90,x=0,y=0,j=0,k=0;

	freqs = 100.collect{m=m+1};
    amp  = freqs.reciprocal;
	phasex = 100.collect{
		anglex=(anglex+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
		x=exp(Complex(0,1)*(anglex.degrad));
		x=x.real.round(0.00001);
	};
	phasey = 100.collect{
		angley=(angley+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
		y=exp(Complex(0,1)*(angley.degrad));
		y=y.imag.round(0.00001);
	};
	phasej = 100.collect{
		anglej=(anglej+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
		j=exp(Complex(0,1)*(anglej.degrad));
		j=j.theta;
	};
	phasek = 50.collect{
		anglek=(anglek+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
		k=exp(Complex(0,1)*(anglek.degrad));
		k=k.theta;
	};



	audiox = PanAz.ar(2,SinOsc.ar( fund,0.degrad+phasej,mul:amp),LFSaw.ar(0.1,phasex));
	audioy = PanAz.ar(2,SinOsc.ar( fund,90.degrad+phasek,mul:amp),LFSaw.ar(0.1,phasey));
	//audioj = PanAz.ar(4,SinOsc.ar( fund*freqs,90.degrad,mul:amp),LFSaw.ar(1,phasej));
	//audiok = PanAz.ar(4,SinOsc.ar( fund*freqs,90.degrad,mul:amp),LFSaw.ar(1,phasek));

	audiox = Out.ar(0,Mix(LPF.ar(audiox),440));
	audioy = Out.ar(0,Mix(LPF.ar(audioy),440));
	//audioj = Out.ar(0,Mix(LPF.ar(audioj),440));
	//audiok = Out.ar(0,Mix(LPF.ar(audiok),440));


}.play
)

{ LFSaw.ar(20, [0, 0.5]) }.plot(0.1);
{ SinOsc.ar(20, [0.degrad,-90.degrad]) }.plot(0.1)



// (
// (SynthDef.new(\oa, {
// 	var  n1=1,cutt=440,freqs, audiox,audioy, amp, m=0, fund=220, phasex,phasey,anglex=0,angley=0,x=0,y=0,mfreq;
// 	var osc1,osc2,freq1, bank, pitch1, t=2;
// 	var wrappedOut = { |busArray, signalArray|
// 		// magic trick to expand to the larger of the two arrays
// 		[busArray, signalArray].flop.do { |pair|
// 	Out.ar(pair[0], pair[1])}};
// 	var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
// 	//var out = NamedControl.kr(\out, [0, 1,2,3]);  // multiple buses!
//
// 	bank=100;
// 	mfreq=WhiteNoise.ar(1);
// 	n1=0;
// 	pitch1=2.pow(n1/(2*6));
// 	fund=(((4*t)-1)*((4*t)/2));
// 	freq1 = (fund*6);
// 	freqs = bank.collect{m=m+1};
// 	amp  = freqs.reciprocal;
// 	phasex = bank.collect{
// 		anglex=(anglex+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
// 		x=exp(Complex(0,1)*(anglex.degrad));
// 		x=x.real.round(0.0001);
// 	};
// 	phasey = bank.collect{
// 		angley=(angley+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
// 		y=exp(Complex(0,1)*(angley.degrad));
// 		y=y.imag.round(0.0001);
// 	};
//
// 	osc1 = PanAz.ar(2,SinOsc.ar(freq1*freqs*pitch1,0.degrad,mul:amp),LFSaw.ar(1,phasex));
// 	osc2 = PanAz.ar(2,SinOsc.ar(freq1*freqs*pitch1,90.degrad,mul:amp),LFSaw.ar(1,phasey));
//
// 	osc1 = wrappedOut.value(out, Mix(LPF.ar(LeakDC.ar(osc1),cutt)));
// 	osc2 = wrappedOut.value(out, Mix(LPF.ar(LeakDC.ar(osc2),cutt)));
//
// }).add;);
//
// )

(
SynthDef.new(\oa, {
	arg  n1=1, cutt=1200,decay=6,t=2,attack=0.01,angle1=137.5;
	var tf, detune1, osc1,osc2;
	var freq1, env,m=1,bank, pitch1, fund;
	var wrappedOut = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
	var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	//var out = NamedControl.kr(\out, [0, 1,2,3]);  // multiple buses!
	bank=24;
	//n1=WhiteNoise.ar(12);
	pitch1=2.pow(n1/(2*6));
	fund=(((4*t)-1)*((4*t)/2));
	freq1 = (fund*6)+WhiteNoise.kr(2);

	bank.do{

detune1=exp(Complex(0,1)*(angle1.degrad));

osc1=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:m.reciprocal,phase:0.degrad), LFSaw.kr(1,detune1.real.round(0.0001)));

osc2=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:m.reciprocal,phase:90.degrad), LFSaw.kr(1,detune1.imag.round(0.0001)));


m=m+1;
angle1=(angle1+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);

	//wrappedOut.value(out, LPF.ar(LeakDC.ar(osc1*2),cutt));
	//wrappedOut.value(out, LPF.ar(LeakDC.ar(osc2*2),cutt));

			Out.ar(0,LPF.ar(LeakDC.ar((osc1)),cutt));
			Out.ar(0,LPF.ar(LeakDC.ar((osc2)),cutt));
	};
}).add;

)
Synth.new(\oa)

(
SynthDef.new(\oa, {
	arg  n1=1, cutt=1200,decay=6,t=2,attack=0.01,angle1=0;
	var tf, detune1, osc1,osc2;
	var freq1, env,m=1,bank, pitch1, fund;
	var wrappedOut = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
	var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	//var out = NamedControl.kr(\out, [0, 1,2,3]);  // multiple buses!
	bank=24;
	//n1=WhiteNoise.ar(12);
	pitch1=2.pow(n1/(2*6));
	fund=(((4*t)-1)*((4*t)/2));
	freq1 = (fund*6)+WhiteNoise.kr(2);

env=EnvGen.ar(Env.perc(attack,decay,pitch1.reciprocal),doneAction:2,levelScale:2);
//env=EnvGen.ar(Env.sine(decay,pitch1.reciprocal),doneAction:2);

	bank.do{

detune1=exp(Complex(0,1)*(angle1.degrad));

osc1=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:LFNoise2.kr(1,m.reciprocal).abs,phase:0.degrad+detune1.theta), LFSaw.kr(1,detune1.real.round(0.0001)));

osc2=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:LFNoise2.kr(1,m.reciprocal).abs,phase:90.degrad+detune1.theta), LFSaw.kr(1,detune1.imag.round(0.0001)));


m=m+1;
angle1=(angle1+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);

	//wrappedOut.value(out, LPF.ar(LeakDC.ar(osc1*2),cutt));
	//wrappedOut.value(out, LPF.ar(LeakDC.ar(osc2*2),cutt));

			Out.ar(0,LPF.ar(LeakDC.ar((osc1)*env*LFNoise2.kr(1,1).abs),cutt));
			Out.ar(0,LPF.ar(LeakDC.ar((osc2)*env*LFNoise2.kr(1,1).abs),cutt));
	};
}).add;

SynthDef.new(\ob, {
	arg  n1=1, cutt=1200,decay=6,t=2,attack=0.01,angle1=0;
	var tf, detune1, osc1,osc2;
	var freq1, env,m=1,bank, pitch1, fund;
	var wrappedOut = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
	var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	//var out = NamedControl.kr(\out, [0, 1,2,3]);  // multiple buses!
	bank=24;
	//n1=WhiteNoise.ar(12);
	pitch1=2.pow(n1/(2*6));
	fund=(((4*t)-1)*((4*t)/2));
	freq1 = (fund*8)+WhiteNoise.kr(2);

env=EnvGen.ar(Env.perc(attack,decay,pitch1.reciprocal),doneAction:2,levelScale:3/4);
//env=EnvGen.ar(Env.sine(decay,pitch1.reciprocal),doneAction:2);

	bank.do{

detune1=exp(Complex(0,1)*(angle1.degrad));

osc1=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:LFNoise2.kr(1,m.reciprocal).abs,phase:0.degrad+detune1.theta), LFSaw.kr(1,detune1.real.round(0.0001)));

osc2=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:LFNoise2.kr(1,m.reciprocal).abs,phase:90.degrad+detune1.theta), LFSaw.kr(1,detune1.imag.round(0.0001)));


m=m+1;
angle1=(angle1+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);

	//wrappedOut.value(out, LPF.ar(LeakDC.ar(osc1*2),cutt));
	//wrappedOut.value(out, LPF.ar(LeakDC.ar(osc2*2),cutt));

			Out.ar(0,LPF.ar(LeakDC.ar((osc1)*env*LFNoise2.kr(1,1).abs),cutt));
			Out.ar(0,LPF.ar(LeakDC.ar((osc2)*env*LFNoise2.kr(1,1).abs),cutt));
	};
}).add;

SynthDef.new(\oc, {
	arg  n1=1, cutt=1200,decay=6,t=2,attack=0.01,angle1=0;
	var tf, detune1, osc1,osc2;
	var freq1, env,m=1,bank, pitch1, fund;
	var wrappedOut = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
	var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	//var out = NamedControl.kr(\out, [0, 1,2,3]);  // multiple buses!
	bank=24;
	//n1=WhiteNoise.ar(12);
	pitch1=2.pow(n1/(2*6));
	fund=(((4*t)-1)*((4*t)/2));
	freq1 = (fund*9)+WhiteNoise.kr(2);

env=EnvGen.ar(Env.perc(attack,decay,pitch1.reciprocal),doneAction:2,levelScale:2/3);
//env=EnvGen.ar(Env.sine(decay,pitch1.reciprocal),doneAction:2);

	bank.do{

detune1=exp(Complex(0,1)*(angle1.degrad));

osc1=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:LFNoise2.kr(1,m.reciprocal).abs,phase:0.degrad+detune1.theta), LFSaw.kr(1,detune1.real.round(0.0001)));

osc2=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:LFNoise2.kr(1,m.reciprocal).abs,phase:90.degrad+detune1.theta), LFSaw.kr(1,detune1.imag.round(0.0001)));


m=m+1;
angle1=(angle1+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);

	//wrappedOut.value(out, LPF.ar(LeakDC.ar(osc1*2),cutt));
	//wrappedOut.value(out, LPF.ar(LeakDC.ar(osc2*2),cutt));

			Out.ar(0,LPF.ar(LeakDC.ar((osc1)*env*LFNoise2.kr(1,1).abs),cutt));
			Out.ar(0,LPF.ar(LeakDC.ar((osc2)*env*LFNoise2.kr(1,1).abs),cutt));
	};
}).add;

SynthDef.new(\od, {
	arg  n1=1, cutt=1200,decay=6,t=2,attack=0.01,angle1=0;
	var tf, detune1, osc1,osc2;
	var freq1, env,m=1,bank, pitch1, fund;
	var wrappedOut = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
	var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	//var out = NamedControl.kr(\out, [0, 1,2,3]);  // multiple buses!
	bank=24;
	//n1=WhiteNoise.ar(12);
	pitch1=2.pow(n1/(2*6));
	fund=(((4*t)-1)*((4*t)/2));
	freq1 = (fund*12)+WhiteNoise.kr(2);

env=EnvGen.ar(Env.perc(attack,decay,pitch1.reciprocal),doneAction:2,levelScale:1);
//env=EnvGen.ar(Env.sine(decay,pitch1.reciprocal),doneAction:2);

	bank.do{

detune1=exp(Complex(0,1)*(angle1.degrad));

osc1=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:LFNoise2.kr(1,m.reciprocal).abs,phase:0.degrad+detune1.theta), LFSaw.kr(1,detune1.real.round(0.0001)));

osc2=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:LFNoise2.kr(1,m.reciprocal).abs,phase:90.degrad+detune1.theta), LFSaw.kr(1,detune1.imag.round(0.0001)));


m=m+1;
angle1=(angle1+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);

	//wrappedOut.value(out, LPF.ar(LeakDC.ar(osc1*2),cutt));
	//wrappedOut.value(out, LPF.ar(LeakDC.ar(osc2*2),cutt));

			Out.ar(0,LPF.ar(LeakDC.ar((osc1)*env*LFNoise2.kr(1,1).abs),cutt));
			Out.ar(0,LPF.ar(LeakDC.ar((osc2)*env*LFNoise2.kr(1,1).abs),cutt));
	};
}).add;

)




(
a=Pdef(\1, Pbind(\instrument, \oa,
	//\dur,1/2,
	\dur,Pbrown(1/2,1,1/8,inf),
\n1,Prand([
0,5,7,12],inf),

	\cutt,Pbrown(220*2,220*16,100,inf),
		//\out,Pn(Pshuf([0, 1], 1), inf).clump(2).collect([_]),
	\out,Pn(Pshuf([0, 1,2,3], 1), inf).clump(4).collect([_]),
		//\attack,Pbrown(0.01,0.5,0.1,inf),
	//\angle1,Pexprand(0.0001,360,inf),
	\decay,Pbrown(2,4,1,inf);
));
b=Pdef(\2, Pbind(\instrument, \ob,
	//\dur,1/2,
	\dur,Pbrown(1/2,1,1/8,inf),
\n1,Prand([
0,5,7,12],inf),

	\cutt,Pbrown(220*2,220*16,100,inf),
		//\out,Pn(Pshuf([0, 1], 1), inf).clump(2).collect([_]),
\out,Pn(Pshuf([0, 1,2,3], 1), inf).clump(4).collect([_]),
		//\attack,Pbrown(0.01,0.5,0.1,inf),
	//\angle1,Pexprand(0.0001,360,inf),
	\decay,Pbrown(2,8,1,inf);
));
c=Pdef(\3, Pbind(\instrument, \oc,
	//\dur,1/2,
	\dur,Pbrown(1/2,1,1/8,inf),
\n1,Prand([
0,5,7,12],inf),

	\cutt,Pbrown(220*2,220*16,100,inf),
		//\out,Pn(Pshuf([0, 1], 1), inf).clump(2).collect([_]),
	\out,Pn(Pshuf([0, 1,2,3], 1), inf).clump(4).collect([_]),
		//\attack,Pbrown(0.01,0.5,0.1,inf),
	//\angle1,Pexprand(0.0001,360,inf),
	\decay,Pbrown(2,4,1,inf);
));
d=Pdef(\4, Pbind(\instrument, \od,
	//\dur,1/2,
	\dur,Pbrown(1/2,1,1/8,inf),
\n1,Prand([
0,5,7,12],inf),

	\cutt,Pbrown(220*2,220*16,100,inf),
		//\out,Pn(Pshuf([0, 1], 1), inf).clump(2).collect([_]),
\out,Pn(Pshuf([0, 1,2,3], 1), inf).clump(4).collect([_]),
		//\attack,Pbrown(0.01,0.5,0.1,inf),
	//\angle1,Pexprand(0.0001,360,inf),
	\decay,Pbrown(2,4,1,inf);
));
)

(
a.play;
b.play;
c.play;
d.play;
)