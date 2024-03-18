{SinOsc.ar(0.1,mul:360).poll}.play


(
{Out.ar(0,Pan2.ar(SinOsc.ar(220,SinOsc.kr(0.022,0.degrad,360).abs.degrad),SinOsc.ar(220,0.degrad)))}.play;
{Out.ar(1,Pan2.ar(SinOsc.ar(220,SinOsc.kr(0.022,90.degrad,360).abs.degrad),SinOsc.ar(220,90.degrad)))}.play;
)

(
{Out.ar(0,SinOsc.ar(100,0.degrad))}.play;
{Out.ar(1,SinOsc.ar(100,90.degrad))}.play;
)


(
{Out.ar(0,SinOsc.ar(220,SinOsc.kr(0.022,SinOsc.kr(0.022,0.degrad,360).abs.degrad,360).abs.degrad))}.play;
{Out.ar(1,SinOsc.ar(220,SinOsc.kr(0.022,SinOsc.kr(0.022,90.degrad,360).abs.degrad,360).abs.degrad))}.play;
)