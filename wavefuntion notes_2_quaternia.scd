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
var i = Quaternion(0, (1/3).sqrt, 0, 0),j = Quaternion(0, 0, (1/3).sqrt, 0),k = Quaternion(0, 0, 0, (1/3).sqrt),q1,q2,v1,v2,v3,angle=0,ph1x,ph1y,ph1z,ph2x,ph2y,ph2z,ph3x,ph3y,ph3z;


1.do{
	angle=(angle+(60)).wrap(0,360);
 	q1=(cos(angle.degrad)+(sin(angle.degrad)*(i+j+k)));
 	q2=q1.conjugate;
	v1=Quaternion(0,1,2,3);
	//v2=Quaternion(0,0,1,0);
	//v3=Quaternion(0,0,0,1);
	v1=q1*v1;
	//v2=q1*v2;
	//v3=q1*v3;
	//v=v*q2 opposite direction rotation
	//v=v*q2;
 	v1.coordinates.round(0.0001).postln;
	//v2.coordinates.round(0.0001).postln;
	//v3.coordinates.round(0.0001).postln;
	ph1x=Complex(v1.a.round(0.0001),v1.b.round(0.0001)).phase;
	ph1y=Complex(v1.a.round(0.0001),v1.c.round(0.0001)).phase;
	ph1z=Complex(v1.a.round(0.0001),v1.d.round(0.0001)).phase;
	//ph2x=Complex(v2.a.round(0.0001),v2.b.round(0.0001)).phase;
	//ph2y=Complex(v2.a.round(0.0001),v2.c.round(0.0001)).phase;
	//ph2z=Complex(v2.a.round(0.0001),v2.d.round(0.0001)).phase;
	//ph3x=Complex(v3.a.round(0.0001),v3.b.round(0.0001)).phase;
	//ph3y=Complex(v3.a.round(0.0001),v3.c.round(0.0001)).phase;
	//ph3z=Complex(v3.a.round(0.0001),v3.d.round(0.0001)).phase;
	ph1x.postln;

 }

)

(
var i = Quaternion(0, (1/3).sqrt, 0, 0),j = Quaternion(0, 0, (1/3).sqrt, 0),k = Quaternion(0, 0, 0, (1/3).sqrt),q1,q2,v1,v2,v3,angle=0,ph1x,ph1y,ph1z,ph2x,ph2y,ph2z,ph3x,ph3y,ph3z;


1.do{
	angle=(angle+(0)).wrap(0,360);
 	q1=(cos(angle.degrad)+(sin(angle.degrad)*(i+j+k)));
 	q2=q1.conjugate;
	v1=Quaternion(0,1,0,0);
	//v2=Quaternion(0,0,1,0);
	//v3=Quaternion(0,0,0,1);
	v1=q1*v1;
	//v2=q1*v2;
	//v3=q1*v3;
	//v=v*q2 opposite direction rotation
	//v=v*q2;
 	v1.coordinates.round(0.0001).postln;
	//v2.coordinates.round(0.0001).postln;
	//v3.coordinates.round(0.0001).postln;
	ph1x=Complex(v1.a.round(0.0001),v1.b.round(0.0001)).phase;
	ph1y=Complex(v1.a.round(0.0001),v1.c.round(0.0001)).phase;
	ph1z=Complex(v1.a.round(0.0001),v1.d.round(0.0001)).phase;
	//ph2x=Complex(v2.a.round(0.0001),v2.b.round(0.0001)).phase;
	//ph2y=Complex(v2.a.round(0.0001),v2.c.round(0.0001)).phase;
	//ph2z=Complex(v2.a.round(0.0001),v2.d.round(0.0001)).phase;
	//ph3x=Complex(v3.a.round(0.0001),v3.b.round(0.0001)).phase;
	//ph3y=Complex(v3.a.round(0.0001),v3.c.round(0.0001)).phase;
	//ph3z=Complex(v3.a.round(0.0001),v3.d.round(0.0001)).phase;
	ph1x.postln;

 }

)

(
{
var m=1,fund=110,freq,osc,q,v,x,y,z,angle=0,i = Quaternion(0, (1/3).sqrt, 0, 0);
var j = Quaternion(0, 0, (1/3).sqrt, 0),k = Quaternion(0, 0, 0, (1/3).sqrt);

	v=Quaternion(0,1,0,0);

	3.do{

         q=(cos(angle.degrad)+(sin(angle.degrad)*(i+j+k)));

		v=q*v;

		v=v*m;

		v.b.abs.postln;

		osc=SinOsc.ar(fund*v.b.abs,mul:v.b.abs.reciprocal);

		Out.ar(0,osc!2);

		m=m+1;

		angle=(angle+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);


	};

}.play;
)


(

var i = Quaternion(0, (1/3).sqrt, 0, 0),j = Quaternion(0, 0, (1/3).sqrt, 0),k = Quaternion(0, 0, 0, (1/3).sqrt),q1,q2,v1,v2,v3,angle=0,ph1x,ph1y,ph1z,ph2x,ph2y,ph2z,ph3x,ph3y,ph3z;



angle=MouseX.kr(2pi.neg,2pi);
 	q1=(angle+(angle*(i+j+k)));
 	q2=q1.conjugate;
	v1=Quaternion(0,1,0,0);

	v1=q1*v1;

 	v1.coordinates.round(0.0001).poll;

	ph1x=Complex(v1.a.round(0.0001),v1.b.round(0.0001)).phase;
	ph1y=Complex(v1.a.round(0.0001),v1.c.round(0.0001)).phase;
	ph1z=Complex(v1.a.round(0.0001),v1.d.round(0.0001)).phase;

	ph1x.poll;

)

(
var i = Quaternion(0, (1/3).sqrt, 0, 0),j = Quaternion(0, 0, (1/3).sqrt, 0),k = Quaternion(0, 0, 0, (1/3).sqrt);
var q,v,angle=0,x,y,z,phx,phy,phz;
var run=true,scale=300,m=1;

///////0//////////////////////////////////////////////////////////////////////////////////////////////////
    Window.closeAll;
    w = Window("S",Rect(400,100,800,800),scroll:false).front.alwaysOnTop_(true);
    w.alpha = 1;  w.view.background = Color.green;

~v = UserView.new(w,Rect(0,0,800,800)).background_(Color.white);
~v.animate;
~v.drawFunc ={
Pen.translate(400,400);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////points
v=Quaternion(0,1,0,0);

2000.do{

	q=(cos(angle.degrad)+(sin(angle.degrad)*(i+j+k)));
		v=q*v;
		x=v.b.round(0.0001)*scale;
		y=v.c.round(0.0001)*scale;
		z=v.d.round(0.0001)*scale;
		phx=Complex(v.a.round(0.0001),v.b.round(0.0001)).phase;
		phy=Complex(v.a.round(0.0001),v.c.round(0.0001)).phase;
		phz=Complex(v.a.round(0.0001),v.d.round(0.0001)).phase;

Pen.width=0.1;

			//Color(red:0.9999.rand,green:0.9999.rand,blue:0.9999.rand).set;
//Color(red:1,green:1,blue:1,alpha:1).set;
		Color.black.set;




//Pen.addOval(Rect.new(Polar.new(x,phx).asPoint.x,Polar.new(y,phy).asPoint.y,1,1));
//Pen.addOval(Rect.new(Polar.new(x,phx).asPoint.x,Polar.new(z,phz).asPoint.y,1,1));
//Pen.addOval(Rect.new(Polar.new(y,phy).asPoint.x,Polar.new(z,phz).asPoint.y,1,1));

		//Pen.lineTo(Point.new(x,y));
		Pen.arcTo(Point(x,y),Point(x,z),z);


		Pen.rotate(pi/2);
		Pen.stroke;
		//~v.refresh;

angle=(angle+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
		m=m+0.00001;


			};

};
{ while { run } {~v.background_(Color.white); ~v.refresh; (1/60).wait } }.fork(AppClock);
)

(