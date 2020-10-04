# grp7AxelChrille
A shootout in space

Projektgenomgång i slutet av readme:n!

## Filer
### Game
	init(); OK
	draw();OK
	gameOver(); OK

### Input

### Player
	update(); OK
	draw(); OK
	begränsad till spelfönster. OK

### Enemies
	update();OK
	draw();OK
	spawnar utanför, kommer in i fönster. -mja, på kanten.

### Generic bullet class
	update(); OK
	draw(); OK

### enemyBullet class
	extendar bullet OK

### playerBullet class
	extendar bullet OK

### collision class
	kollar enemyBullet mot player och playerBullet mot enemies OK


## Design
	Börja med basic former, utöka i senare skede om deadline ger möjlighet. OK

## Bonus
	astroider att gömma sig bakom/krocka med. -nein.
	bakgrund - nice space pic OK
	snyggare grafik/sprites/shapes OK
	hp function -hos fiender, ej visuell. OK
	ljud OK
	sikta/skjut oberoende av skeppets riktning OK
	fiender spawnar utanför, men går inte ut ur fönstret igen. Se ovan.

###	What have we learned? (important) 
	--medieimport, 
	--djupare förståelse för rotate/transform +
	-- användning av push/pop
	-- att noloop ändå kör draw en gång, bra att sätta gamestate över hela draw då, 
	--blev bekvämare i att jobba med github

### What was hard? 
	--Rotatebuggen, en bugg som dels autoroterade skeppet när det låg stilla.
	Samt sen att det flippade på flygläget när man inte hade input men ändå lite fart. 
	Annars hade vi ganska bra flöde många små buggar och klur över småsaker men ändå nöjda.
	Inget som höll oss låsta i mer än någon timma.

### What are we most pleased with? 
	--Att vi pressade ut något! 
	Att vi kom ett litet men viktigt steg närmare målet då vi faktiskt nu gjort ett spel.
	Hur litet det än må vara. 
	Sen många små delsegrar i lösningar som gör att vi är nöjda med projektets genomförande.

### How much time did you spend? 
	Mkt i början, "crunch" måndag. 
	Men överlag klara på onsdag och sen polish i mycket lungnare takt. 
	Inga krav på varandra utan vi fick undersöka det vi kände för att implementera.

### Funny things that happened? bugs? 
	Skottbuggen som blev minor :) 
	Skotten åkte inte iväg från skeppet när man stod stilla.
	Detta blev till working as intended med "minor" som först bara var stillastående skott.
	Men sen blev implementerat på riktigt.
	Samt galna rotatebuggen när man stod stilla ovan var rolig och utmanande.

