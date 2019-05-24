"FLOYD for PLANETFALL 
(C) COPYRIGHT 1983 INFOCOM, INC. ALL RIGHTS RESERVED

This file contains objects and actions for Floyd."

<OBJECT FLOYD
	(LOC ROBOT-SHOP)
	(DESC "multiple purpose robot")
	(FDESC
"Only one robot, about four feet high, looks even remotely close to being
in working order.")
	(SYNONYM FLOYD COMPARTMENT ROBOT COMPANION)
	(ADJECTIVE MULTIPLE PURPOSE DIM-WITTED DIM WITTED)
	(FLAGS CONTBIT SEARCHBIT TRANSBIT OPENBIT LIGHTBIT)
	(CAPACITY 5)
	(ACTION FLOYD-F)>

<GLOBAL CARD-STOLEN <>> ;"true if you took elev. card from turned-off Floyd"

<ROUTINE FLOYD-F ("AUX" X N)
	 <COND (<EQUAL? ,FLOYD ,WINNER>
		<SETG FLOYD-SPOKE T>
		<COND (<AND <VERB? GIVE>
			    <EQUAL? ,PRSI ,ME>>
		       <SETG WINNER ,ADVENTURER>
		       <PERFORM ,V?ASK-FOR ,FLOYD ,PRSO>
		       <RTRUE>)
		      (<AND <VERB? SGIVE>
			    <EQUAL? ,PRSO ,ME>>
		       <SETG WINNER ,ADVENTURER>
		       <PERFORM ,V?ASK-FOR ,FLOYD ,PRSI>
		       <RTRUE>)
		      (<VERB? WALK>
		       <COND (<AND <EQUAL? ,HERE ,REPAIR-ROOM>
				   <EQUAL? ,PRSO ,P?NORTH ,P?IN>>
			      <FLOYD-THROUGH-HOLE>)
			     (<AND <EQUAL? ,HERE ,BIO-LOCK-EAST>
				   <EQUAL? ,PRSO ,P?EAST>>
			      <FLOYD-INTO-LAB>)
			     (<AND <EQUAL? ,HERE ,RADIATION-LOCK-EAST>
				   <EQUAL? ,PRSO ,P?EAST>>
			      <TELL"\"After you.\"" CR>)
			     (T
			      <TELL
"Floyd looks slightly embarrassed. \"You know me and my sense of direction.\"
Then he looks up at you with wide, trusting eyes. \"Tell Floyd
a story?\"" CR>)>
		       <COND (<FLUSH>
			      <RFATAL>)>
		       <RTRUE>)
		      (<VERB? THROUGH>
		       <FLOYDS-FAMOUS-DOOR-ROUTINE>
		       <COND (<FLUSH> <RFATAL>)>
		       <RTRUE>)
		      (<AND <VERB? TAKE>
			    <EQUAL? ,PRSO ,GOOD-BOARD>>
		       <COND (<NOT <IN? ,GOOD-BOARD ,ROBOT-HOLE>>
			      <TELL
"Floyd looks half-bored and half-annoyed. ""Floyd already did that.
How about some leap-frogger?\"" CR>)
			     (,BOARD-REPORTED
			      <MOVE ,GOOD-BOARD ,ADVENTURER>
			      <FCLEAR ,GOOD-BOARD ,NDESCBIT>
			      <FSET ,GOOD-BOARD ,TAKEBIT>
			      <SETG C-ELAPSED 22>
			      <TELL
"Floyd shrugs. \"If you say so.\" He vanishes for a few minutes, and returns
holding the fromitz board. It seems to be in good shape. He tosses it toward
you, and you just manage to catch it before it smashes." CR>)
			     (T
			      <TELL
"\"Huh?\" asks Floyd. \"What fromitz board?\"" CR>)>)
		      (<AND <VERB? FOLLOW>
			    <EQUAL? ,PRSO ,ME>>
		       <TELL "\"Okay!\"" CR>)
		      (<VERB? HELLO>
		       <SETG WINNER ,ADVENTURER>
		       <PERFORM ,V?HELLO ,FLOYD>
		       <RTRUE>)
		      (<VERB? DROP>
		       <COND (<IN? ,PRSO ,FLOYD>
			      <COND (<PROB 50>
				     <MOVE ,PRSO ,HERE>
				     <TELL
"Floyd shrugs and drops the " D ,PRSO "." CR>)
				    (T
				     <TELL
"Floyd clutches the " D ,PRSO " even more tightly. \"Floyd won't,\" he says
defiantly." CR>)>)
			     (T
			      <FLOYD-NOT-HAVE>)>)
		      (<AND <VERB? READ>
			    <PRSO? ,DIARY>>
		       <SETG WINNER ,ADVENTURER>
		       <PERFORM ,V?SHOW ,DIARY ,FLOYD>
		       <SETG WINNER ,FLOYD>
		       <RTRUE>) 
		      (T
		       <TELL
"Floyd whines, \"Enough talking! Let's play Hider-and-Seeker.\"" CR>
		       <RFATAL>)>)
	       (<VERB? CLOSE>
		<TELL "Huh?" CR>)
	       (<VERB? LOOK-INSIDE REACH>
		<PERFORM ,V?OPEN ,FLOYD>
		<RTRUE>)
	       (<FSET? ,FLOYD ,RLANDBIT>
		<SETG FLOYD-SPOKE T>
		<COND (<VERB? LAMP-ON>
		       <TELL "He's already been activated." CR>)
		      (<VERB? LAMP-OFF>
		       <FCLEAR ,FLOYD ,RLANDBIT>
		       <FCLEAR ,FLOYD ,ACTORBIT>
		       <DISABLE <INT I-FLOYD>>
		       <TELL
"Floyd, shocked by this betrayal from his newfound friend, whimpers
and keels over">
		       <COND (<FIRST? ,FLOYD>
			      <TELL
", dropping what he was carrying." CR>)
			     (T
			      <TELL "." CR>)>
		       <SET X <FIRST? ,FLOYD>>
		       <REPEAT ()
			       <COND (.X
				      <SET N <NEXT? .X>>
				      <MOVE .X ,HERE>
				      <SET X .N>)
				     (T
				      <RETURN>)>>)
		      (<VERB? EXAMINE>
		       <TELL
"From its design, the robot seems to be of the multi-purpose sort. It is
slightly cross-eyed, and its mechanical mouth forms a lopsided grin." CR>)
		      (<VERB? KISS>
		       <TELL 
"You receive a painful electric shock." CR>)
		      (<VERB? SCOLD>
		       <TELL
"Floyd looks defensive. \"What did Floyd do wrong?\"" CR>)
		      (<VERB? PLAY-WITH>
		       <SETG C-ELAPSED 30>
		       <ENABLE <QUEUE I-FLOYD 1>>
		       <TELL
"You play with Floyd for several centichrons until you drop to the floor,
exhausted. Floyd pokes at you gleefully. \"C'mon! Let's play some more!\"" CR>)
		      (<VERB? LISTEN>
		       <TELL "Floyd is babbling about this and that." CR>)
		      (<AND <VERB? TAKE>
			    <EQUAL? ,PRSO ,FLOYD>>
		       <TELL
"You manage to lift Floyd a few inches off the ground, but he is too heavy
and you drop him suddenly. Floyd gives a surprised squeal and moves
a respectable distance away." CR>)
		      (<VERB? ATTACK MUNG>
		       <TELL
"Floyd starts dashing around the room. \"Oh boy oh boy oh boy! I haven't played
Chase and Tag for years! You be It! Nah, nah!\""CR>)
		      (<VERB? KICK SHAKE>
		       <TELL
"\"Why you do that?\" Floyd whines. \"I think a wire now shaken loose.\"
He goes off into a corner and sulks." CR>)
		      (<VERB? HELLO TALK>
		       <TELL
"\"Hi!\" Floyd grins and bounces up and down." CR>)
		      (<VERB? SEARCH SCRUB OPEN>
		       <TELL
"Floyd giggles and pushes you away. \"You're tickling Floyd!\" He clutches at
his side panels, laughing hysterically. Oil drops stream from his eyes." CR>)
		      (<AND <VERB? GIVE PUT SHOW>
			    <EQUAL? ,FLOYD ,PRSI>>
		       <COND (<EQUAL? ,PRSO ,LAZARUS-PART>
			      <MOVE ,LAZARUS-PART ,HERE>
			      <TELL "At first, Floyd is all grins because of your gift. Then, he realizes what it is, begins weeping, drops the breastplate, and ">
				  <COND (<FSET? ,HERE ,FLOYDBIT>
						 <TELL "rushes out of the room." CR>
						 <REMOVE ,FLOYD>
						 <SETG FLOYD-WAITING <>>
						 <SETG FLOYD-FOLLOW <>>
						 <ENABLE <QUEUE I-FLOYD 40>>)
						(T <TELL "moves a respectable distance away." CR>)>)
			     (<EQUAL? ,PRSO ,RED-GOO ,GREEN-GOO ,BROWN-GOO ,HIGH-PROTEIN ,MEDICINE>
			      <TELL
"Floyd looks at the " D ,PRSO ". \"Yech! Got any Number Seven Heavy Grease?\"" CR>)
				 (<FSET? ,PRSO ,LIQUIDBIT>
				  <TELL "Floyd scans the " D ,PRSO ". \"Nope! Floyd all topped up!\"" CR>)
				 (<EQUAL? ,PRSO ,LASER-DIAL ,LASER>
				  <TELL "Floyd peers at the laser. \"Doctor-persons told Floyd not to play with danger-things!\"" CR>)
			     (<OR <FIRST? ,FLOYD>
				  <PROB 25>>
			      <MOVE ,PRSO ,HERE>
			      <TELL
"Floyd examines the " D, PRSO ", shrugs, and drops ">
			      <COND (<EQUAL? ,PRSO ,PLIERS>
				     <TELL "them." CR>)
				    (T
				     <TELL "it." CR>)>)
			     (T
			      <MOVE ,PRSO ,FLOYD>
			      <TELL
"\"Neat!\" exclaims Floyd. He thanks you profusely." CR>)>)
		      (<AND <VERB? SHOW>
			    <EQUAL? ,FLOYD ,PRSI>>
		       <COND (<AND <EQUAL? ,PRSO ,PRINT-OUT>
				   <NOT ,COMPUTER-FLAG>>
			      <COMPUTER-ACTION>)
			     (<EQUAL? ,PRSO ,ROBOT-HOLE>
			      <FLOYD-THROUGH-HOLE>)
			     (<EQUAL? ,PRSO ,DIARY>
			      <TELL "Floyd looks at you earnestly. \"Floyd
would never read someone else's diary!\" He stops and thinks a moment, then
adds, \"Well, at least not a friend's diary.\"" CR>)
			     (<AND <EQUAL? ,HERE ,REC-AREA>
				   <EQUAL? ,PRSO ,PSEUDO-OBJECT>>
			      <TELL
"\"Too intellectual for Floyd. Any paddleball sets around?\"" CR>)
			     (<OR <EQUAL? ,PRSO ,ID-CARD ,SHUTTLE-CARD>
				  <EQUAL? ,PRSO ,KITCHEN-CARD
					        ,UPPER-ELEVATOR-CARD>>
			      <TELL
"Floyd scratches his head. \"Aren't those things usually blue?\"" CR>)
			     (<AND <EQUAL? ,PRSO ,LOWER-ELEVATOR-CARD>
				   <NOT ,CARD-REVEALED>>
			      <SETG CARD-REVEALED T>
			      <TELL
"\"I've got one just like that!\" says Floyd. He looks through several
of his compartments, then glances at you suspiciously." CR>)
			     (T
			      <TELL
"Floyd looks over the " D, PRSO ". \"Can you play any games with it?\"
he asks." CR>)>)
		      (<VERB? RUB>
		       <TELL "Floyd gives a contented sigh." CR>)
		      (<VERB? SMELL>
		       <TELL
"Floyd smells faintly of ozone and light machine oil." CR>)
		      (<VERB? ASK-FOR>
		       <COND (<IN? ,PRSI ,FLOYD>
			      <MOVE ,PRSI ,ADVENTURER>
			      <TELL
"\"Okay,\" says Floyd, handing you the " D, PRSI ", \"but only
because you're Floyd's best friend.\"" CR>)
			     (T
			      <FLOYD-NOT-HAVE>)>)>)
	       (T
		<COND (<VERB? LAMP-ON>
		       <COND (,FLOYD-INTRODUCED
			      <ENABLE <QUEUE I-FLOYD -1>>)
			     (T
			      <ENABLE <QUEUE I-FLOYD 25>>
			      <TELL "Nothing happens." CR>
			      <COND (<NOT ,FLOYD-SCORE-FLAG>
				     <SETG FLOYD-SCORE-FLAG T>
				     <SETG SCORE <+ ,SCORE 2>>)>
			      <RTRUE>)>)
		      (<VERB? LAMP-OFF>
		       <TELL "The robot doesn't seem to be on." CR>)
		      (<VERB? EXAMINE>
		       <TELL
"The deactivated robot is leaning against the wall, its head lolling to the
side. It is short, and seems to be equipped for general-purpose work. It has
apparently been turned off." CR>)
		      (<VERB? SEARCH OPEN>
		       <COND (<AND <NOT ,CARD-REVEALED>
				   <NOT ,CARD-STOLEN>>
			      <FCLEAR ,LOWER-ELEVATOR-CARD ,INVISIBLE>
			      <MOVE ,LOWER-ELEVATOR-CARD ,ADVENTURER>
			      <SCORE-OBJ ,LOWER-ELEVATOR-CARD>
			      <SETG CARD-STOLEN T>
			      <TELL
"In one of the robot's compartments you find and take a magnetic-striped card
embossed \"loowur elivaatur akses kard.\"" CR>)
			     (T
			      <TELL
"Your search discovers nothing in the robot's compartments except a
single crayon which you leave where you found it." CR>)>)>)>>

<ROUTINE FLOYDS-FAMOUS-DOOR-ROUTINE ()
	 <COND (<EQUAL? ,PRSO ,ROBOT-HOLE>
		<FLOYD-THROUGH-HOLE>)
	       (<EQUAL? ,PRSO ,BIO-DOOR-EAST>
		<FLOYD-INTO-LAB>)
	       (<FSET? ,PRSO ,DOORBIT>
		<TELL "\"You go first,\" says Floyd." CR>)
	       (T
		<TELL "Floyd scratches his head and looks at you." CR>)>>

<ROUTINE FLUSH ()
	 <COND (,P-CONT
		<SETG P-CONT <>>
		<TELL CR
"Floyd scratches his head and looks at you. \"What else were you saying to
Floyd? I can't remember.\"" CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE FLOYD-INTO-LAB ()
	 <COND (,FLOYD-WAITING
		<TELL "\"As soon as you open the door, dummy.\"" CR>)
	       (T
		<TELL
"\"Are you kidding? Floyd not going in THERE without a good reason.\"" CR>)>>

<ROUTINE FLOYD-NOT-HAVE ()
	 <TELL "\"Floyd does not one of those have!\"" CR>>

<GLOBAL FLOYD-SCORE-FLAG <>>

<GLOBAL FLOYD-SPOKE <>> ;"so Floyd doesn't do two things on the same turn"

<GLOBAL FLOYD-FOLLOW <>> ;"checks if Floyd was in room where you just were"

<GLOBAL FLOYD-REACTIVATED <>> ;"checks if Floyd has been turned on before"

<GLOBAL FLOYD-INTRODUCED <>> ;"checks if Floyd has met you before"

<ROUTINE FLOYD-COMES-ALIVE ("AUX" FOO)
	 <COND (<IN? ,FLOYD ,HERE>
		<COND (,FLOYD-REACTIVATED
		       <SETG FLOYD-SPOKE T>
		       <TELL
"Floyd jumps to his feet, hopping mad. \"Why you turn Floyd off?\" he
asks accusingly." CR>)
		      (T
		       <SETG FLOYD-INTRODUCED T>
		       <SETG FLOYD-SPOKE T>
		       <CRLF>
		       <TELL 
"Suddenly, the robot comes to life and its head starts swivelling about.
It notices you and bounds over. \"Hi! I'm B-19-7, but to everyperson I'm
called Floyd. Are you a doctor-person or a planner-person? ">
		       <COND (<SET FOO <FIRST? ,ADVENTURER>>
			      <TELL
"That's a nice " D .FOO " you are having there. ">)>
		       <TELL
"Let's play Hider-and-Seeker you with me.\"" CR>)>)>
	 <FSET ,FLOYD ,RLANDBIT>
	 <FSET ,FLOYD ,ACTORBIT>
	 <FSET ,FLOYD ,TOUCHBIT>
	 <SETG FLOYD-REACTIVATED T>>

<ROUTINE I-FLOYD ()
	 <ENABLE <QUEUE I-FLOYD -1>>
	 <COND (<NOT <FSET? ,FLOYD ,RLANDBIT>>
		<FSET ,FLOYD ,ACTORBIT>
		<FLOYD-COMES-ALIVE>)
	       (<IN? ,FLOYD ,HERE>
		<COND (<NOT ,FLOYD-INTRODUCED>
		       <SETG FLOYD-INTRODUCED T>
		       <TELL CR
"The robot, now apparently active, notices you enter. \"Hi,\"
he says. \"I'm Floyd!\"" CR>)
		      (<AND ,FLOYD-FOLLOW
			    <FSET? ,HERE ,FLOYDBIT>
			    <PROB 6>>
		       <REMOVE ,FLOYD>
		       <SETG FLOYD-FOLLOW <>>
		       <TELL CR
"Floyd says \"Floyd going exploring. See you later.\"
He glides out of the room." CR>)
		      (T
		       <SETG FLOYD-FOLLOW T>
		       <COND (<AND <PROB 40>
				   <NOT ,FLOYD-SPOKE>>
			      <TELL "Floyd ">
			      <TELL <PICK-ONE ,FLOYDISMS>>
			      <TELL "." CR>
			      <RTRUE>)>)>)
	       (T	;"Floyd is active but not present"
		<COND (<AND ,FLOYD-FOLLOW <PROB 80>>
		       <COND (<IN? ,LAZARUS-PART ,HERE>
			      <SETG FLOYD-FOLLOW <>>
			      <TELL CR
"Floyd starts to follow you but notices the Lazarus breast plate.
He sniffs and leaves the room." CR>
			      <RTRUE>)>
		       <MOVE ,FLOYD ,HERE>
		       <TELL "Floyd follows you." CR>
		       <KLUDGE>)
		      (T
		       <SETG FLOYD-FOLLOW <>>
		       <COND (<EQUAL? ,HERE ,BOOTH-1 ,BOOTH-2 ,BOOTH-3>
			      <MOVE ,FLOYD ,HERE>
			      <COND (<NOT ,FLOYD-INTRODUCED>
				     <CRLF>
				     <CALL-ME-FLOYD>
				     <RTRUE>)>
			      <TELL CR
"Floyd scampers into the booth. \"Oooo,
this is a tiny room,\" he remarks." CR>)
			     (<OR
			       <AND <EQUAL? ,HERE ,BIO-LOCK-EAST
				                  ,BIO-LOCK-WEST>
				    <NOT ,FLOYD-GAVE-UP>>
			       <EQUAL? ,HERE ,RADIATION-LOCK-EAST
				             ,RADIATION-LOCK-WEST>>
			      <MOVE ,FLOYD ,HERE>
			      <COND (<NOT ,FLOYD-INTRODUCED>
				     <CRLF>
				     <CALL-ME-FLOYD>
				     <RTRUE>)>
			      <TELL CR
"Floyd glides after you. \"Is this... is this a squash court?\" he asks." CR>)
			     (<OR <EQUAL? ,HERE ,ALFIE-CONTROL-EAST
					        ,ALFIE-CONTROL-WEST>
			          <EQUAL? ,HERE ,BETTY-CONTROL-EAST
					        ,BETTY-CONTROL-WEST>
			          <EQUAL? ,HERE ,UPPER-ELEVATOR ,LOWER-ELEVATOR
					        ,REACTOR-ELEVATOR>
				  <AND <EQUAL? ,HERE ,MESS-HALL>
				       <IN? ,FLOYD ,KITCHEN>>>
			      <MOVE ,FLOYD ,HERE>
			      <COND (<NOT ,FLOYD-INTRODUCED>
				     <CRLF>
				     <CALL-ME-FLOYD>
				     <RTRUE>)>
			      <TELL CR "Floyd bounces into the ">
			      <COND (<EQUAL? ,HERE ,UPPER-ELEVATOR
				             ,LOWER-ELEVATOR ,REACTOR-ELEVATOR>
				     <TELL "elevator">)
				    (<EQUAL? ,HERE ,MESS-HALL>
				     <TELL "room">)
				    (T
				     <TELL "cabin">)>
			      <TELL
". \"Hey, wait for Floyd!\" he yells, smiling broadly." CR>)
			     (<EQUAL? ,HERE ,MINI-BOOTH>
			      <MOVE ,FLOYD ,HERE>
			      <COND (<NOT ,FLOYD-INTRODUCED>
				     <CRLF>
				     <CALL-ME-FLOYD>
				     <RTRUE>)>
			      <TELL CR
"\"Hi,\" whispers Floyd, tiptoeing in. \"Are we going to teleport into
the computer like Achilles always used to do?\"" CR>)
			     (<PROB 30>
			      <COND (<AND <EQUAL? ,HERE ,INFIRMARY>
					  ,LAZARUS-FLAG>
				     <RFALSE>)>
			      <MOVE ,FLOYD ,HERE>
			      <COND (,FLOYD-INTRODUCED
				     <COND (<AND <PROB 15>
						 <NOT <IN? ,ADVENTURER ,BED>>>
					    <TELL CR
"Floyd rushes into the room and barrels into you. \"Oops, sorry,\" he says.
\"Floyd not looking at where he was going to.\"" CR>)
					   (T
					    <TELL CR
"Floyd bounds into the room. \"Floyd here now!\" he cries." CR>)>
				     <KLUDGE>)
				    (T
				     <CRLF>
				     <CALL-ME-FLOYD>)>)>)>)>
	 <SETG FLOYD-SPOKE <>>>

<ROUTINE CALL-ME-FLOYD ()
	 <SETG FLOYD-INTRODUCED T>
	 <TELL
"The robot you were fiddling with in the Robot Shop bounds into the room.
\"Hi!\" he says, with a wide and friendly smile. \"You turn Floyd on?
Be Floyd's friend, yes?\"" CR>>

<ROUTINE KLUDGE ()
	 <COND (<AND <EQUAL? ,HERE ,REPAIR-ROOM>
		     <NOT ,ACHILLES-FLAG>>
		<SETG ACHILLES-FLAG T>
		<SETG FLOYD-SPOKE T>
		<TELL
"Floyd points at the fallen robot. \"That's Achilles. He was in charge of
repairing machinery. He repaired Floyd once. I never liked him much; he
wasn't friendly like other robots. Looks like he fell down the stairs.
He always had trouble with one of his feet working right. A Planner-person
once told me that's why they named him Achilles.\"" CR>)
	       (<AND <EQUAL? ,HERE ,COMPUTER-ROOM>
		     <NOT ,COMPUTER-FLAG>>
		<COMPUTER-ACTION>)>>

<OBJECT DEAD-FLOYD
	(DESC "mangled robot")
	(LDESC
"Your former companion, Floyd, is lying on the ground in a pool of oil.")
	(SYNONYM FLOYD ROBOT COMPANION)
	(ADJECTIVE MANGLE DEAD FORMER)
	(ACTION DEAD-FLOYD-F)>

<ROUTINE DEAD-FLOYD-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"You turn to look at Floyd, but a tremendous sense of loss overcomes you, and
you turn away." CR>)
	       (<VERB? LAMP-ON>
		<TELL
"As you touch Floyd's on-off switch, it falls off in your hands." CR>)
	       (<VERB? LAMP-OFF>
		<TELL
"I'm afraid that Floyd has already been turned off, permanently, and gone to
that great robot shop in the sky." CR>)>>

<CONSTANT FLOYDISMS
	<PLTABLE
	 "paces impatiently"
	 "absentmindedly recites the first six hundred digits of pi"
	 "lowers his voice and tells you the latest rumors about Dr. Fizpick"
	 "recalls the time he bruised his knee"
	 "chants the death scene from \"Carmen\""
	 "cranes his neck to see what you are doing"
	 "rubs his head affectionately against your shoulder"
	 "asks if you want to play Hucka-Bucka-Beanstalk"
	 "examines himself for signs of rust"
	 "absentmindedly oils one of his joints"
	 "wanders restlessly around the room"
	 "notices a mouse scurrying by and tries to hide behind you"
	 "sings an ancient ballad, totally out of key"
	 "frets about the possibility of his batteries failing"
	 "reminisces about his friend Lazarus, a medical robot"
	 "relates some fond memories about his robotic friend Lazarus"
	 "whistles tunelessly"
	 "tells you about the time he helped someone sharpen a pencil"
	 "yawns and looks bored"
	 "produces a crayon from one of his compartments and scrawls
his name on the wall">>

<ROUTINE FLOYD-HERE-AWAKE ()
	<AND <IN? ,FLOYD ,HERE> <FSET? ,FLOYD ,RLANDBIT>>>