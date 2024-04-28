(
s.options.numWireBufs = 1024*16;
s.options.numOutputBusChannels=2;
s.options.numInputBusChannels=0;
TempoClock.default.tempo_(120/120);
s.options.memSize = 8192*64;
//s.options.blockSize = 64/4;
s.waitForBoot
)
Server.killAll
(
var  anglex=0,angley=0,x=0,y=0;


	~x = 10000.collect{
		anglex=(anglex+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
		x=exp(Complex(0,1)*(anglex.degrad));
	x=x.real
	};

~y = 10000.collect{
		angley=(angley+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
		y=exp(Complex(0,1)*(angley.degrad));
	y=y.imag
	};


)

exp(Complex(0,1)*(180.degrad)).real;


(cos(67.degrad)+(sin(67.degrad)*Complex(0,1))).round(0.0001)

(cos(67.degrad)+(sin(67.degrad)*Quaternion(0,0,1,0))).coordinates.round(0.0001)


(
var i = Quaternion(0, 0, 0, 0),j = Quaternion(0, 0, 0, 0),k = Quaternion(0, 0, 0, 1),q1,q2,v,angle=0;


1.do{
	angle=(angle+(90)).wrap(0,360);
 	q1=(cos(angle.degrad)+(sin(angle.degrad)*(i+j+k)));
 	q2=q1.conjugate;
	v=Quaternion(0,1,1,1);
	v=q1*v;
	//v=v*q2 opposite direction rotation
	//v=v*q2;
 	v.coordinates.round(0.0001).postln
 }

)

(
var i = (1/3).sqrt,j = (1/3).sqrt,k = (1/3).sqrt;

(i*i)+(j*j)+(k*k);

)


0.5.pow(2)*4

Quaternion(1,0,0,0).norm
Quaternion(0,0.5774,0.5774,0.5774).norm
(
var  anglex=0,angley=0,anglez=0,x=0,y=0,z=0;


	~x = 10000.collect{
		anglex=(anglex+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
		x=(cos(anglex.degrad)+(sin(anglex.degrad)*Quaternion(0,1,1,1)));
	x=x.b;
	};
	~y = 10000.collect{
		angley=(angley+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
		y=(cos(angley.degrad)+(sin(angley.degrad)*Quaternion(0,1,1,1)));
	y=y.c;
	};
	~z = 10000.collect{
		anglez=(anglez+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
		z=(cos(anglez.degrad)+(sin(anglez.degrad)*Quaternion(0,1,1,1)));
	z=z.d;
	};


)
~x
Env.new(~x,[1],\sine).plot

{SinOsc.ar(440,phase:0.degrad)}.play;
{SinOsc.ar(440*2,phase:0.degrad)}.play;
{SinOsc.ar(440*3,phase:0.degrad)}.play;
{SinOsc.ar(440*4,phase:0.degrad)}.play;

{SinOsc.ar(440,phase:0.degrad)+
SinOsc.ar(440*2,phase:0.degrad)+
SinOsc.ar(440*3,phase:0.degrad)+
SinOsc.ar(440*4,phase:0.degrad)}.play;

(
{
var m=1,sig,part,anglex=0,x;

		x=exp(Complex(0,1)*(anglex.degrad));
	part=Pan2.ar(SinOsc.ar(220*m,mul:m.reciprocal),x.imag);

100.do{
	m=m+1;
	anglex=(anglex+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
		x=exp(Complex(0,1)*(anglex.degrad));
		part=part+Pan2.ar(SinOsc.ar(220*m,mul:m.reciprocal),x.imag);
};
Out.ar(0,part);
}.play

)

(
{
var m=1,sig,part;


100.do{
	part=SinOsc.ar(220*m,mul:m.reciprocal);
		m=m+1;
		Out.ar(0,part);
};
}.play

)


(
var freq = 440;
//{Out.ar(1,SinOsc.ar(freq,90.degrad,EnvGen.ar(Env.new(~y,[freq.reciprocal/4],\sine),doneAction:2)))}.play;
{Out.ar(0,SinOsc.ar(freq,0.degrad,add:EnvGen.ar(Env.new(~x,[freq.reciprocal],\sine),doneAction:2)))}.play;
)

(
var freq = 440;
{Out.ar(1,Pan2.ar(SinOsc.ar(freq,0.degrad),EnvGen.ar(Env.new(~y,[freq.reciprocal],\sine),doneAction:2)))}.play;
{Out.ar(0,Pan2.ar(SinOsc.ar(freq,0.degrad),EnvGen.ar(Env.new(~x,[freq.reciprocal],\sine),doneAction:2)))}.play;
)





(
SynthDef.new(\oa, {
	arg  n1=1, cutt=1200,decay=6,t=2,attack=0.01,angle1=0,angle2=90;
	var tf, detune1,detune2, osc1,osc2,w1,w2;
	var freq1, env,m=1,bank, pitch1, fund;
	var wrappedOut1 = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
		var wrappedOut2 = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
	var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	//var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	bank=6;
	//n1=WhiteNoise.ar(12);
	pitch1=2.pow(n1/(2*6));
	fund=(((4*t)-1)*((4*t)/2));
	freq1 = (fund*6)*pitch1;

env=EnvGen.ar(Env.perc(attack,decay,pitch1.reciprocal),doneAction:2,levelScale:2);
//env=EnvGen.ar(Env.sine(decay,pitch1.reciprocal),doneAction:2,levelScale:2);

	bank.do{

detune1=exp(Complex(0,1)*(SinOsc.ar(0.01,angle1.degrad,2pi).abs));
detune2=exp(Complex(0,1)*(SinOsc.ar(0.01,angle2.degrad,2pi).abs));

w1=EnvGen.ar(Env.new(~x,[(freq1*m).reciprocal/2],\sine));
w2=EnvGen.ar(Env.new(~y,[(freq1*m).reciprocal/2],\sine));

osc1=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:m.reciprocal,add:w1,phase:SinOsc.ar(0.1,detune1.theta,2pi)), LFSaw.ar(0.1,detune1.theta.linlin(2pi.neg,2pi,1.neg,1)));

osc2=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:m.reciprocal,add:w2,phase:SinOsc.ar(0.1,detune2.theta,2pi)), LFSaw.ar(0.1,detune2.theta.linlin(2pi.neg,2pi,1.neg,1)));

m=m+1;
angle1=(angle1+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
angle2=(angle2+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);

		wrappedOut1.value(out,LPF.ar(LeakDC.ar((osc1)*env),cutt));
	wrappedOut2.value(out, LPF.ar(LeakDC.ar((osc2)*env),cutt));

	};
}).add;

SynthDef.new(\ob, {
arg  n1=1, cutt=1200,decay=6,t=2,attack=0.01,angle1=0,angle2=90;
	var tf, detune1,detune2, osc1,osc2,w1,w2;
	var freq1, env,m=1,bank, pitch1, fund;
	var wrappedOut1 = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
		var wrappedOut2 = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
	var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	//var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	bank=6;
	//n1=WhiteNoise.ar(12);
	pitch1=2.pow(n1/(2*6));
	fund=(((4*t)-1)*((4*t)/2));
		freq1 = (fund*8)*pitch1;

env=EnvGen.ar(Env.perc(attack,decay,pitch1.reciprocal),doneAction:2,levelScale:3/4);
//env=EnvGen.ar(Env.sine(decay,pitch1.reciprocal),doneAction:2,levelScale:3/4);

	bank.do{

detune1=exp(Complex(0,1)*(SinOsc.ar(0.01,angle1.degrad,2pi).abs));
detune2=exp(Complex(0,1)*(SinOsc.ar(0.01,angle2.degrad,2pi).abs));

w1=EnvGen.ar(Env.new(~x,[(freq1*m).reciprocal/2],\sine));
w2=EnvGen.ar(Env.new(~y,[(freq1*m).reciprocal/2],\sine));

osc1=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:m.reciprocal,add:w1,phase:SinOsc.ar(0.1,detune1.theta,2pi)), LFSaw.ar(0.1,detune1.theta.linlin(2pi.neg,2pi,1.neg,1)));

osc2=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:m.reciprocal,add:w2,phase:SinOsc.ar(0.1,detune2.theta,2pi)), LFSaw.ar(0.1,detune2.theta.linlin(2pi.neg,2pi,1.neg,1)));
m=m+1;
angle1=(angle1+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
angle2=(angle2+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);

		wrappedOut1.value(out,LPF.ar(LeakDC.ar((osc1)*env),cutt));
	wrappedOut2.value(out, LPF.ar(LeakDC.ar((osc2)*env),cutt));

	};
}).add;

SynthDef.new(\oc, {
arg  n1=1, cutt=1200,decay=6,t=2,attack=0.01,angle1=0,angle2=90;
	var tf, detune1,detune2, osc1,osc2,w1,w2;
	var freq1, env,m=1,bank, pitch1, fund;
	var wrappedOut1 = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
		var wrappedOut2 = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
	var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	//var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	bank=6;
	//n1=WhiteNoise.ar(12);
	pitch1=2.pow(n1/(2*6));
	fund=(((4*t)-1)*((4*t)/2));
		freq1 = (fund*9)*pitch1;

env=EnvGen.ar(Env.perc(attack,decay,pitch1.reciprocal),doneAction:2,levelScale:2/3);
//env=EnvGen.ar(Env.sine(decay,pitch1.reciprocal),doneAction:2,levelScale:2/3);

	bank.do{

detune1=exp(Complex(0,1)*(SinOsc.ar(0.01,angle1.degrad,2pi).abs));
detune2=exp(Complex(0,1)*(SinOsc.ar(0.01,angle2.degrad,2pi).abs));

w1=EnvGen.ar(Env.new(~x,[(freq1*m).reciprocal/2],\sine));
w2=EnvGen.ar(Env.new(~y,[(freq1*m).reciprocal/2],\sine));

osc1=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:m.reciprocal,add:w1,phase:SinOsc.ar(0.1,detune1.theta,2pi)), LFSaw.ar(0.1,detune1.theta.linlin(2pi.neg,2pi,1.neg,1)));

osc2=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:m.reciprocal,add:w2,phase:SinOsc.ar(0.1,detune2.theta,2pi)), LFSaw.ar(0.1,detune2.theta.linlin(2pi.neg,2pi,1.neg,1)));

m=m+1;
angle1=(angle1+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
angle2=(angle2+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);

		wrappedOut1.value(out,LPF.ar(LeakDC.ar((osc1)*env),cutt));
	wrappedOut2.value(out, LPF.ar(LeakDC.ar((osc2)*env),cutt));

	};
}).add;

SynthDef.new(\od, {
arg  n1=1, cutt=1200,decay=6,t=2,attack=0.01,angle1=0,angle2=90;
	var tf, detune1,detune2, osc1,osc2,w1,w2;
	var freq1, env,m=1,bank, pitch1, fund;
	var wrappedOut1 = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
		var wrappedOut2 = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
	var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	//var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	bank=6;
	//n1=WhiteNoise.ar(12);
	pitch1=2.pow(n1/(2*6));
	fund=(((4*t)-1)*((4*t)/2));
		freq1 = (fund*12)*pitch1;

env=EnvGen.ar(Env.perc(attack,decay,pitch1.reciprocal),doneAction:2,levelScale:1);
//env=EnvGen.ar(Env.sine(decay,pitch1.reciprocal),doneAction:2,levelScale:1);

	bank.do{

detune1=exp(Complex(0,1)*(SinOsc.ar(0.01,angle1.degrad,2pi).abs));
detune2=exp(Complex(0,1)*(SinOsc.ar(0.01,angle2.degrad,2pi).abs));

w1=EnvGen.ar(Env.new(~x,[(freq1*m).reciprocal/2],\sine));
w2=EnvGen.ar(Env.new(~y,[(freq1*m).reciprocal/2],\sine));

osc1=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:m.reciprocal,add:w1,phase:SinOsc.ar(0.1,detune1.theta,2pi)), LFSaw.ar(0.1,detune1.theta.linlin(2pi.neg,2pi,1.neg,1)));

osc2=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:m.reciprocal,add:w2,phase:SinOsc.ar(0.1,detune2.theta,2pi)), LFSaw.ar(0.1,detune2.theta.linlin(2pi.neg,2pi,1.neg,1)));

m=m+1;
angle1=(angle1+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
angle2=(angle2+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);

		wrappedOut1.value(out,LPF.ar(LeakDC.ar((osc1)*env),cutt));
	wrappedOut2.value(out, LPF.ar(LeakDC.ar((osc2)*env),cutt));

	};
}).add;

)

(
var  anglex=0,angley=0,x=0,y=0;


	~phasex = 10000.collect{
		anglex=(anglex+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
		x=exp(Complex(0,1)*(anglex.degrad));
	x=x.theta
	};


)



(
a=Pdef(\1, Pbind(\instrument, \oa,
	//\dur,1/2,
	\dur,Pseq(~phasex.abs,inf),
\n1,Pseq([0,5,7,12,17,19,24],inf),
	\cutt,Pbrown(220*2,220*8,100,inf),
		\out,Pn(Pshuf([0, 1], 1), inf).clump(2).collect([_]),
	//\out,Pn(Pshuf([0, 1], 1), inf).clump(4).collect([_]),
		//\attack,Pbrown(0.01,0.5,0.1,inf),
	//\angle1,Pexprand(0.0001,360,inf),
	\decay,Pbrown(2,8,1,inf);
));
b=Pdef(\2, Pbind(\instrument, \ob,
	//\dur,1/2,
	\dur,Pseq(~phasex.abs,inf),
\n1,Prand([0,5,7,12,17,19,24],inf),
	\cutt,Pbrown(220*2,220*8,100,inf),
		\out,Pn(Pshuf([0, 1], 1), inf).clump(2).collect([_]),
	//\out,Pn(Pshuf([0, 1], 1), inf).clump(4).collect([_]),
		//\attack,Pbrown(0.01,0.5,0.1,inf),
	//\angle1,Pexprand(0.0001,360,inf),
	\decay,Pbrown(2,8,1,inf);
));
c=Pdef(\3, Pbind(\instrument, \oc,
	//\dur,1/2,
	\dur,Pseq(~phasex.abs,inf),
\n1,Prand([0,5,7,12,17,19,24],inf),
	\cutt,Pbrown(220*2,220*8,100,inf),
		\out,Pn(Pshuf([0, 1], 1), inf).clump(2).collect([_]),
	//\out,Pn(Pshuf([0, 1], 1), inf).clump(4).collect([_]),
		//\attack,Pbrown(0.01,0.5,0.1,inf),
	//\angle1,Pexprand(0.0001,360,inf),
	\decay,Pbrown(2,8,1,inf);
));
d=Pdef(\4, Pbind(\instrument, \od,
	//\dur,1/2,
	\dur,Pseq(~phasex.abs,inf),
\n1,Prand([0,5,7,12,17,19,24],inf),
	\cutt,Pbrown(220*2,220*8,100,inf),
	\out,Pn(Pshuf([0, 1], 1), inf).clump(2).collect([_]),
	//\out,Pn(Pshuf([0, 1], 1), inf).clump(4).collect([_]),
		//\attack,Pbrown(0.01,0.5,0.1,inf),
	//\angle1,Pexprand(0.0001,360,inf),
	\decay,Pbrown(2,8,1,inf);
));
)

(
a.play;
b.play;
c.play;
d.play;
)



(

(
SynthDef.new(\oe, {
arg  n1=0, cutt=1200,decay=6,t=2,attack=0.01,angle1=0,angle2=90;
	var tf, detune1,detune2, osc1,osc2,w1,w2;
	var freq1,m=1,bank, pitch1, fund;
	var wrappedOut1 = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
		var wrappedOut2 = { |busArray, signalArray|
	// magic trick to expand to the larger of the two arrays
	[busArray, signalArray].flop.do { |pair|
		Out.ar(pair[0], pair[1])
	}
};
	var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	//var out = NamedControl.kr(\out, [0, 1]);  // multiple buses!
	bank=24;
	//n1=WhiteNoise.ar(12);
	pitch1=2.pow(n1/(2*6));
	fund=(((4*t)-1)*((4*t)/2));
		freq1 = (fund*6)*pitch1;

	bank.do{

detune1=exp(Complex(0,1)*(SinOsc.ar(0.01,angle1.degrad,2pi).abs));
detune2=exp(Complex(0,1)*(SinOsc.ar(0.01,angle2.degrad,2pi).abs));

w1=EnvGen.ar(Env.new(~x,[(freq1*m).reciprocal/2],\sine),levelScale:m.reciprocal);
w2=EnvGen.ar(Env.new(~y,[(freq1*m).reciprocal/2],\sine),levelScale:m.reciprocal);

osc1=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:w1,phase:SinOsc.ar(0.1,detune1.theta,2pi)), LFSaw.ar(0.1,detune1.theta.linlin(2pi.neg,2pi,1.neg,1)));

osc2=PanAz.ar(2,SinOsc.ar((freq1*m)*pitch1,mul:w2,phase:SinOsc.ar(0.1,detune2.theta,2pi)), LFSaw.ar(0.1,detune2.theta.linlin(2pi.neg,2pi,1.neg,1)));

m=m+1;
angle1=(angle1+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
angle2=(angle2+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);

		wrappedOut1.value(out,LPF.ar(LeakDC.ar((osc1)),cutt));
	wrappedOut2.value(out, LPF.ar(LeakDC.ar((osc2)),cutt));

	};
}).add;

)
Synth(\oe);


(
SynthDef.new(\oe, {
arg  n1=0,t=2;
	var detune1,detune2, osc1,osc2,w1,w2;
	var freq1, pitch1, fund;

	pitch1=2.pow(n1/(2*6));
	fund=(((4*t)-1)*((4*t)/2));
		freq1 = (fund*12)*pitch1;

w1=EnvGen.ar(Env.new(~x,[freq1.reciprocal/2],\sine));
w2=EnvGen.ar(Env.new(~y,[freq1.reciprocal/2],\sine));

	osc1=SinOsc.ar((freq1)*pitch1,phase:0.degrad,add:w1);

	osc2=SinOsc.ar((freq1)*pitch1,phase:90.degrad,add:w2);


			Out.ar(0,LeakDC.ar(osc1));
		Out.ar(1,LeakDC.ar(osc2));

}).add;

)
Synth(\oe);


