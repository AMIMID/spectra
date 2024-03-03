{(Out.kr(0,Dust.kr(100000,10).poll))}.play

{(Out.ar(0,LFPulse.ar(1000,width:1).abs.poll))}.play


{(Out.kr(0,SinOsc.kr(0.02).abs.poll))}.play




(
(SynthDef.new(\oa, {
	arg  n1=1,n2=1, cutt=1300,decay=6,t=2,attack=0.01,angle1;
	var amps,tf,tfBuf=0;
	var detune1, osc1;
	var freq1, env1,m=1,x=0;
	var bank, pitch1;
	var fund,trig = Impulse.ar(0);
	var wrappedOut = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
	var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	//var out = NamedControl.kr(\out, [0, 1,2,3]);  // multiple buses!
	bank=12;
	angle1=45;
	pitch1=2.pow(n1/(2*6));
fund=(((4*t)-1)*((4*t)/2))/2;
	freq1 = fund*6+WhiteNoise.kr(1).abs;

	bank.do{

env1=EnvGen.ar(Env.perc(attack,decay,pitch1.reciprocal),doneAction:2,levelScale:1/2);
//env1=EnvGen.ar(Env.sine(decay,pitch1.reciprocal),doneAction:2);
		detune1=exp(Complex(0,1)*(angle1.degrad));

		osc1=PanAz.ar(2,FreeVerb.ar(SinOsc.ar((freq1*m)*pitch1,mul:BrownNoise.kr(1).abs,
			phase:(detune1.theta+BrownNoise.kr(1).abs).wrap(pi.neg,pi))),
		(detune1.real.round(0.0001)+BrownNoise.kr(1).abs).wrap(1.neg,1));


m=m+1;
	//m.postln;
				angle1=(angle1+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);

	wrappedOut.value(out, LPF.ar(LeakDC.ar(((osc1)*env1)*BrownNoise.kr(1).abs),cutt));

		//trig = TDelay.ar(trig, 0.1);
	};
}).add;);
(SynthDef.new(\ob, {
	arg  n1=1,n2=1, cutt=1300,decay=6,t=2,attack=0.01,angle1;
	var amps,tf,tfBuf=0;
	var detune1, osc1;
	var freq1, env1,m=1,x=0;
	var bank, pitch1;
	var fund,trig = Impulse.ar(0);
	var wrappedOut = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
	var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	//var out = NamedControl.kr(\out, [0, 1,2,3]);  // multiple buses!
	bank=12;
	angle1=45;
	pitch1=2.pow(n1/(2*6));
fund=(((4*t)-1)*((4*t)/2))/2;
	freq1 = (fund*8)+WhiteNoise.kr(1).abs;

	bank.do{
env1=EnvGen.ar(Env.perc(attack,decay,pitch1.reciprocal),doneAction:2,levelScale:1/2);
//env1=EnvGen.ar(Env.sine(decay,pitch1.reciprocal),doneAction:2);

		detune1=exp(Complex(0,1)*(angle1.degrad));

		osc1=PanAz.ar(2,FreeVerb.ar(SinOsc.ar((freq1*m)*pitch1,mul:BrownNoise.kr(1).abs,
			phase:(detune1.theta+BrownNoise.kr(1).abs).wrap(pi.neg,pi))),
		(detune1.real.round(0.0001)+BrownNoise.kr(1).abs).wrap(1.neg,1));


m=m+1;
	//m.postln;
				angle1=(angle1+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);

	wrappedOut.value(out, LPF.ar(LeakDC.ar(((osc1)*env1)*BrownNoise.kr(1).abs),cutt));

		//trig = TDelay.ar(trig, 0.1);
	};
}).add;);
(SynthDef.new(\oc, {
	arg  n1=1,n2=1, cutt=1300,decay=6,t=2,attack=0.01,angle1;
	var amps,tf,tfBuf=0;
	var detune1, osc1;
	var freq1, env1,m=1,x=0;
	var bank, pitch1;
	var fund,trig = Impulse.ar(0);
	var wrappedOut = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
	var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	//var out = NamedControl.kr(\out, [0, 1,2,3]);  // multiple buses!
	bank=12;
	angle1=45;
	pitch1=2.pow(n1/(2*6));
fund=(((4*t)-1)*((4*t)/2))/2;
	freq1 = (fund*9)+WhiteNoise.kr(1).abs;

	bank.do{

env1=EnvGen.ar(Env.perc(attack,decay,pitch1.reciprocal),doneAction:2,levelScale:1/2);
//env1=EnvGen.ar(Env.sine(decay,pitch1.reciprocal),doneAction:2);
		detune1=exp(Complex(0,1)*(angle1.degrad));

		osc1=PanAz.ar(2,FreeVerb.ar(SinOsc.ar((freq1*m)*pitch1,mul:BrownNoise.kr(1).abs,
			phase:(detune1.theta+BrownNoise.kr(1).abs).wrap(pi.neg,pi))),
		(detune1.real.round(0.0001)+BrownNoise.kr(1).abs).wrap(1.neg,1));

m=m+1;
	//m.postln;
				angle1=(angle1+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);

	wrappedOut.value(out, LPF.ar(LeakDC.ar(((osc1)*env1)*BrownNoise.kr(1).abs),cutt));

		//trig = TDelay.ar(trig, 0.1);
	};
}).add;);
(SynthDef.new(\od, {
	arg  n1=1,n2=1, cutt=1300,decay=6,t=2,attack=0.01,angle1;
	var amps,tf,tfBuf=0;
	var detune1, osc1;
	var freq1, env1,m=1,x=0;
	var bank, pitch1;
	var fund,trig = Impulse.ar(0);
	var wrappedOut = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
	var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	//var out = NamedControl.kr(\out, [0, 1,2,3]);  // multiple buses!
	bank=12;
	angle1=45;
	pitch1=2.pow(n1/(2*6));
fund=(((4*t)-1)*((4*t)/2))/2;
	freq1 = (fund*12)+WhiteNoise.kr(1).abs;

	bank.do{

env1=EnvGen.ar(Env.perc(attack,decay,pitch1.reciprocal),doneAction:2,levelScale:1/2);
//env1=EnvGen.ar(Env.sine(decay,pitch1.reciprocal),doneAction:2);

		detune1=exp(Complex(0,1)*(angle1.degrad));

		osc1=PanAz.ar(2,FreeVerb.ar(SinOsc.ar((freq1*m)*pitch1,mul:BrownNoise.kr(1).abs,
			phase:(detune1.theta+BrownNoise.kr(1).abs).wrap(pi.neg,pi))),
		(detune1.real.round(0.0001)+BrownNoise.kr(1).abs).wrap(1.neg,1));


m=m+1;
	//m.postln;
				angle1=(angle1+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);

	wrappedOut.value(out, LPF.ar(LeakDC.ar(((osc1)*env1)*BrownNoise.kr(1).abs),cutt));

		//trig = TDelay.ar(trig, 0.1);
	};
}).add;);
)


(
a=Pdef(\1, Pbind(\instrument, \oa,
	//\dur,1/2,
	\dur,Pbrown(1/2,1,1/8,inf),
\n1,Prand([
0,5,7,12],inf),

	\cutt,Pbrown(220*2,220*16,100,inf),
		\out,Pn(Pshuf([0, 1], 1), inf).clump(2).collect([_]),
	//\out,Pn(Pshuf([0, 1,2,3], 1), inf).clump(4).collect([_]),
		//\attack,Pbrown(0.01,0.5,0.1,inf),
	\angle1,Pexprand(0.0001,360,inf),
	\decay,Pbrown(2,4,1,inf);
));
b=Pdef(\2, Pbind(\instrument, \ob,
	//\dur,1/2,
	\dur,Pbrown(1/2,1,1/8,inf),
\n1,Prand([
0,5,7,12],inf),

	\cutt,Pbrown(220*2,220*16,100,inf),
		\out,Pn(Pshuf([0, 1], 1), inf).clump(2).collect([_]),
	//\out,Pn(Pshuf([0, 1,2,3], 1), inf).clump(4).collect([_]),
		//\attack,Pbrown(0.01,0.5,0.1,inf),
	\angle1,Pexprand(0.0001,360,inf),
	\decay,Pbrown(2,8,1,inf);
));
c=Pdef(\3, Pbind(\instrument, \oc,
	//\dur,1/2,
	\dur,Pbrown(1/2,1,1/8,inf),
\n1,Prand([
0,5,7,12],inf),

	\cutt,Pbrown(220*2,220*16,100,inf),
		\out,Pn(Pshuf([0, 1], 1), inf).clump(2).collect([_]),
	//\out,Pn(Pshuf([0, 1,2,3], 1), inf).clump(4).collect([_]),
		//\attack,Pbrown(0.01,0.5,0.1,inf),
	\angle1,Pexprand(0.0001,360,inf),
	\decay,Pbrown(2,4,1,inf);
));
d=Pdef(\4, Pbind(\instrument, \od,
	//\dur,1/2,
	\dur,Pbrown(1/2,1,1/8,inf),
\n1,Prand([
0,5,7,12],inf),

	\cutt,Pbrown(220*2,220*16,100,inf),
		\out,Pn(Pshuf([0, 1], 1), inf).clump(2).collect([_]),
	//\out,Pn(Pshuf([0, 1,2,3], 1), inf).clump(4).collect([_]),
		//\attack,Pbrown(0.01,0.5,0.1,inf),
	\angle1,Pexprand(0.0001,360,inf),
	\decay,Pbrown(2,4,1,inf);
));
)

(
a.play;
b.play;
c.play;
d.play;
)