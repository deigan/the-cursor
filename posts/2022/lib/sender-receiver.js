// TODO: 
// startRound redundancy?


const srSim = (s, withCharts, sLearning, rLearning, showMessages, allStrats, withForgetting) => {

	var friction = 0.01;
	
	s.startStratNum = 2;

	if (allStrats) {
		s.startStratNum = 4
	}

	//if (withForgetting) {
	//	s.startStratNum = 4;
	//}

	s.forgettingPoint = 64;

	var goal, sender, receiver, movers, messages, 
		hist, sPoints, rounds, reward, chartWidth, chartHeight;

	var sMenu, rMenu

	var sPick = 'none'
	var rPick = 'none'


	s.setup = () => {
		w = s._userNode.clientWidth;
		let h = w;

		chartWidth = .85*w/3
		chartHeight = .8 * chartWidth;

		
		let c = s.createCanvas(w,h);

		s.textFont('Roboto Mono');

		s.startOver();
		
		s.noLoop()

		if (!showMessages) {
			playButton(document.getElementById("no-mess-pb"), sr_NoMessages)
		}

	}

	s.sStratPick = (pick) => {
		sPick = pick;
		
		// ugly character counting hack
		if (pick[3] === '0') {
			sender.brain.setStrats(0,1);
		} else if (pick[3] === '1') {
			sender.brain.setStrats(1,0);
		} else {
			sender.brain.setStrats(1,1);
		}
		reallyDraw();
	}

	s.rStratPick = (pick) => {
		rPick = pick;

		// ugly character counting hack
		if (pick[0] === '0') {
			receiver.brain.setStrats(0,1);
		} else if (pick[0] === '1') {
			receiver.brain.setStrats(1,0);
		} else {
			receiver.brain.setStrats(1,1);
		}
		reallyDraw();
	}

	s.startOver = () => {
		hist = [];
		sPoints = [];
		rounds = 0;
		reward = 0
		justStarted = true;


		s.sBrain = new Brain();
		s.rBrain = new Brain();

		startRound(s.sBrain, s.rBrain);

		if (sPick === 'none') {
		} else {
			s.sStratPick(sPick)
		}

		if (rPick === 'none') {
		} else {
			s.rStratPick(rPick)
		}
	
		reallyDraw();
	}

	s.draw = () => {
		// number of rounds based on slider value
		for (let n = 0; n < s.pow(2,s._userNode.parentNode.childNodes[1].firstElementChild.value); n++) {
		    for (m of movers) {
		      m.update()
		      if (m.life == 0){
		        kill(m)
		      }
		    }
		
		    if (goal.pos.dist(receiver.pos) < goal.r) {
		      reward = 1;
		    }
		
		    if (movers.length == 0) {
			      if (reward < 1) {
			      	reward = -1;
			      	streak = 0;
			      	hist.push(false)
			      } else {
			        hist.push(true)
			      }
			      
			    if (sPoints.length * 1 < rounds) {
			    	let sY = hist.map(x => x ? 1 : 0).reduce((p,c) => p+c)/hist.length;
			    	sPoints.push(sY)
			    }
	
				rounds += 1
	
			    if (sLearning) {
			      sender.learn()
			    }
			    if (rLearning) {
			      receiver.learn()
			    }
			      
			      
			      
			      if (hist.length > 100) {
			        hist.shift()
			      }
			      
			      
			      startRound(sender.brain, receiver.brain); 
		  	}
		}

		reallyDraw();
	}


	function reallyDraw() {

		s.background(255);
		goal.show()
		for (m of movers) {
			m.show()
  		}

		if (goal.pos.dist(receiver.pos) < goal.r) {
	       goal.highlight()
	      // s.background(0,200,0,50)
		      } else if (receiver.pos.x < goal.r || receiver.pos.x > s.width-goal.r) {
	      // s.background(200,0,0,100)
		      }

		if (withCharts) {
			sender.chartShow();
			receiver.chartShow();
		}
  

		let scx  
		if (withCharts) { 
			scx = 2*chartWidth + .1*s.width;
			//scx = .7 * s.width
		} else {
			scx = chartWidth+.075*s.width;
			//scx = .4 * s.width
		}

		
		s.noStroke();
		successTicker();
		s.stroke(0);
		successChart(scx)
	}

	class Mover {
	  constructor(x,y) {
	    this.pos = s.createVector(x,y);
	    this.vel = s.createVector(0,0);
	    this.acc = s.createVector(0,0);
	    
	    this.r = .04*s.width//20;
	    this.fric = friction;
	    
	    this.life = 200;
	    
	    this.col = [0,0,0]
	    this.alpha = 200;    
	  }
	  
	  update() {
	    this.life -= 1;
	    
	    this.vel.add(this.acc);
	    this.vel.mult(1-this.fric)
	    this.pos.add(this.vel);
	    this.acc.set(0,0)
	  }
	  
	  show() {
	    s.fill(this.col[0],this.col[1],this.col[2]);
	    s.circle(this.pos.x,this.pos.y,this.r*2)
	  }
	}

	class Agent extends Mover {
	  constructor(x,y,b) {
	    super(x,y);
	    this.memory = -1;
	    this.choice = -1;
	    this.actsRemaining = 1;
	    this.brain = b;
	    this.strategy = this.brain.choose();
	
	    
	    
	  }
	  
	  learn() {
	    if (reward === 1) {
	      this.brain.train(this.strategy, reward)
	    }

	   if (withForgetting && this.brain.strategies.length > s.forgettingPoint) {
	       this.brain.strategies.splice(s.floor(s.random(s.forgettingPoint)),1);
	     }

	
	  }
	  
	  find(g) {
	    if (g.pos.x < s.width/2) {
	      this.memory = 0;
	    } else {
	      this.memory = 1;
	    }
	  }
	  
	  
	  
	  send(m,angle) {
	    let dir = s.createVector(5,0);
	    dir.rotate(angle);
	    let message = new Message(m,this.pos.x,this.pos.y+.5*this.r,dir.x,dir.y)
	    movers.push(message)
	    messages.push(message)
	
	  }
	  
	  propel(vec) {
	    this.acc.add(vec);
	  }
	  
	  left() {
	    this.propel(s.createVector(-s.width/150,0))
	  }
	  
	  right() {
	    this.propel(s.createVector(s.width/150,0))
	  }
	  
	  
	   update() {
	     this.choice = this.strategy.get(this.memory);
	     this.act()
	     super.update()
	     for (let m of messages) {
	       if (this.pos.dist(m.pos) < this.r
	          && m.life < 40) {
	         this.memory = m.content;
	         kill(m);
	       }
	     }
	   }
	  
	  chartShow() {
		lightStroke();
		s.fill(0,0)
	  	s.rect(this.chartPos.x, this.chartPos.y, chartWidth, chartHeight)
		chartTitleFormat()
	  	s.text(this.chartLabel, this.chartPos.x, this.chartPos.y)

		let chartBottom = this.chartPos.y + chartHeight;

		  let cu = chartWidth/(1+3*this.brain.stratTypes.length) 
		  let bWidth = 2*cu;
		  let xOffset = cu;

	  	  for (let st of this.brain.stratTypes) {
	  	    let sAmount = this.brain.strategies.map(x => x == st ? 1 : 0).reduce((p,c) => p+c);
	  	    let bHeight = .8*chartHeight*sAmount/this.brain.strategies.length
	  	    
	  	    s.fill(20,40)
	  	    if (this.strategy === st) {
	  	       s.fill(20,150)
	  	        }
	  	    s.rect(this.chartPos.x+xOffset, chartBottom-bHeight, bWidth, bHeight)
	  	    s.fill(20)
	            chartSmallFormat()
	  	    s.text(this.stratLabel(st), this.chartPos.x+xOffset+.5*bWidth, chartBottom+.007*s.width)
	  	     s.textAlign(s.CENTER,s.BOTTOM)
	  	    s.text(sAmount, this.chartPos.x+xOffset+.5*bWidth, chartBottom-bHeight)

		    xOffset += bWidth+cu;
	  	  }
	  	}
	  
	}

	class Sender extends Agent {
	  constructor(x,y,b) {
	    super(x,y,b);
	    this.sender = true
	    this.chartPos = s.createVector(.05*s.width, s.height-chartHeight-.1*s.width)
	    this.chartLabel = "S Strategies";
	  }
	  
	  stratLabel(strat) {
	  let firstLine = ''
	  let secondLine = ''
	  if (strat.get(0) === 0) {
	    firstLine = 'L🡒0';
	  } else {
	    firstLine = 'L🡒1';
	  }
	  
	  if (strat.get(1) === 0) {
	    secondLine = 'R🡒0';
	  } else {
	    secondLine = 'R🡒1'
	  }
	  
	  return firstLine.concat('\n').concat(secondLine)
	}
	  
	  act() {
	    if (this.actsRemaining > 0 && !(this.memory == -1)) {
	      this.actsRemaining -= 1;
	      if (this.choice == 1) {
	        sender.send(1,s.HALF_PI);
	      } else {
	        sender.send(0,s.HALF_PI)
	      }
	    }
	  }
	  
	  show() {
	    super.show();
	    s.fill(255,255)
	    s.textSize(.04*s.width)
	    s.textAlign(s.CENTER, s.CENTER)
	    s.text("S", this.pos.x, this.pos.y)
	  }
	}

class Receiver extends Agent {
  constructor(x,y,b) {
    super(x,y,b);
    this.sender = false
    this.chartPos = s.createVector(chartWidth+.075*s.width, s.height-chartHeight-.1*s.width)
    this.chartLabel = "R Strategies"

  }
  
  stratLabel(strat) {
  let firstLine = ''
  let secondLine = ''
  if (strat.get(0) === 0) {
    firstLine = '0🡒L';
  } else {
    firstLine = '0🡒R';
  }
  
  if (strat.get(1) === 0) {
    secondLine = '1🡒L';
  } else {
    secondLine = '1🡒R'
  }
  
  return firstLine.concat('\n').concat(secondLine)
}
  
  act() {
    if (this.actsRemaining > 0 && !(this.memory == -1)) {
      this.actsRemaining -= 1;
      if (this.choice < .5) {
        receiver.left()
      } else {
        receiver.right()
      }
    }
  }
  
  show() {
    super.show();
    s.fill(255)
    s.textSize(.04*s.width)
    s.textAlign(s.CENTER, s.CENTER)
    s.text("R", this.pos.x, this.pos.y)
  }
}

class Message extends Mover {
  constructor(content,x,y,vx,vy) {
    super(x,y);
    this.r = .0075*s.width; //5
    this.life = 50;
    
    this.vel.set(vx,vy);
    
    this.content = content;
    
    // if (this.content == 1) {
    //   this.col[0] = 200;
    // } else {
    //   this.col[2] = 255
    //   this.col[1] = 150
    // }
  } 
  
  show() {
	if (showMessages) {
    	super.show();
		lightText()
	s.textSize(.04*s.width)
	s.textAlign(s.LEFT, s.BOTTOM);
    	s.text(this.content, this.pos.x+2*this.r, this.pos.y)
	}
  }
}

function kill(m) {
      movers.splice(movers.indexOf(m), 1)
      messages.splice(messages.indexOf(m),1)
}


class Goal {
	  constructor() {
	    this.pos = s.createVector(s.random(s.width), s.random(s.height))
	    this.r = s.width/5;
	    this.color = "#CBF8DF"
	    this.alpha = 100;
	    this.intensity = 100;
	  }
	  
	  twoOption() {
	    this.pos.y = s.height/3;
	    if (this.pos.x < s.width/2) {
	      this.pos.x = 0;
	    } else {
	      this.pos.x = s.width;
	    }
	  }
	  
	  highlight() {
	    this.color = "#54f979";
	    this.intensity = 200;
	    this.alpha = 200;
	  }
	  
	  show() {
	    s.strokeWeight(2)
//	    s.fill(0,this.intensity,0,this.alpha)
	    s.fill(this.color)
	    s.circle(this.pos.x, this.pos.y, this.r*2)
	  }
	}



	class Brain {
	  constructor(states, acts) {
	    
	    this.stratTypes = [
	        new Map([[0,1], [1,0]]),
	        new Map([[0,0], [1,1]]),
	    ]
	    if (allStrats) {
	    		this.stratTypes = this.stratTypes.concat([
	      			new Map([[0,0], [1,0]]),
	        		new Map([[0,1], [1,1]])
	    		])
		}
	    
	    this.strategies = [];
	    // Equal proportions
	    for (let i = 0; i < s.startStratNum; i++) {
	      this.strategies.push(this.stratTypes[i % this.stratTypes.length])
	    }
	  }
	  
	  setStrats(s0,s1,s2,s3) {
	    let s0Array = Array(s0).fill(this.stratTypes[0]);
	    let s1Array = Array(s1).fill(this.stratTypes[1]);
	    this.strategies = s0Array.concat(s1Array)

	    if (allStrats) {
	      let s2Array = Array(s2).fill(this.stratTypes[2]);
	      let s3Array = Array(s3).fill(this.stratTypes[3]);
	      this.strategies = this.strategies.concat(s2Array.concat(s3Array))
		  }

	    startRound(sender.brain, receiver.brain);
	    
	  }
	  
	  choose() {
	    return s.random(this.strategies)
	  }
	  
	  train(strat, reward) {
	    if (reward > 0) {
	       this.strategies.push(strat);
	    }
	    // for (let i = 0; i < reward; i++) {
	    //   this.strategies.push(strat);
	    // }
	    
	     //if (this.strategies.length > settledstratnum) {
	     //  //this.strategies.splice(4+s.floor(s.random(settledstratnum-4)),1);
	     //  this.strategies.splice(s.floor(s.random(settledstratnum)),1);
	     //}
	  }
	}
	
	function startRound(sb, rb) {
	  reward = 0;
	  
	  goal = new Goal();
	  goal.twoOption();
	  
	  //sender = new Sender(s.width/2,s.height/2-150, sb);
	  //receiver = new Receiver(s.width/2,s.height/2, rb);
	  sender = new Sender(s.width/2,s.height/20, sb);
	  receiver = new Receiver(s.width/2,s.height/3, rb);
	  
	  
	  movers = [sender,receiver]
	  messages = []
	  sender.find(goal)
	}

	function successTicker() {
		  let w = s.width/100
		  for (let i = 0; i < hist.length; i++) {
		    if (hist[i]) {
		      //s.fill(0,200,0,200)
//		      s.fill("#54f979")
		      s.fill("#CBF8DF")
		    } else {
	//	      s.fill(255,0,0)
		      s.fill(255,0,0,100)
		    }
		    s.rect(s.width-hist.length*w+w*i, .975*s.height, w, .025*s.height)
		  }
		}

	function successChart(sX) {	
		   let sY = s.height-chartHeight-.1*s.width 
		   let sOff = chartWidth / sPoints.length
		 
		   s.fill(0,0)
		   s.stroke(0,50) 
		   s.rect(sX,sY,chartWidth, chartHeight)
		   s.line(sX, sY+.5*chartHeight, sX+chartWidth, sY+.5*chartHeight); 

		   s.fill(0)
		   chartTitleFormat()
		   s.text('Success', sX, sY)

		   s.textAlign(s.LEFT, s.CENTER)
		   s.text('1',sX+chartWidth+.01*s.width, sY)
		   s.text('.5',sX+chartWidth, sY+.5*chartHeight)
		   s.text('0',sX+chartWidth+.01*s.width, sY+chartHeight-.01*s.width)
		 
		   
		   sInc = s.ceil(sPoints.length/100);
		   sInc = 1
		   s.stroke(0);
		   s.beginShape()
		   for (let i = 0; i < sPoints.length; i+=sInc) {
		     if (i % 50 === 0) {
		       
		       if (
		         i == 0 || 
		         (sPoints.length/2 - i <= 25) && (i - sPoints.length/2 <= 25)
		          ) { 
		         
		   chartSmallFormat()
		   s.text(i, sX, sY+chartHeight+.01*s.width)

		   lightStroke();
		   s.line(sX,sY, sX, sY+chartHeight)
		   s.stroke(0);
		 
		       }
		       
		     }
		     s.vertex(sX,sY+chartHeight-chartHeight*sPoints[i])
		     sX += sInc*sOff;
		   }
		   s.noFill();
		   // s.strokeWeight(2)
		   s.endShape();
		   s.fill(0);
//		   s.stroke(0,5) 
		   chartSmallFormat()
		   s.text(rounds, sX, sY+chartHeight+.01*s.width)
		   s.stroke(0,50) 
//		   s.line(sX,s.height-.275*s.height, sX, s.height-.075*s.height)
		 
		   s.strokeWeight(1)
		   s.stroke(0)
		}

	function lightText() {
		   s.stroke(0,5) 
	}

	function lightStroke() {
		   s.stroke(0,50) 
	}

	function chartTitleFormat() {
		s.fill(0)
		lightText();
		s.textAlign(s.LEFT, s.BOTTOM)
		s.textSize(.030*s.width)

	}
	
	function chartSmallFormat() {
		lightText();
		s.textAlign(s.CENTER,s.TOP)
	   	s.textSize(.025*s.width)
	}

	s.windowResized = () => {
		w = s._userNode.clientWidth;
		s.resizeCanvas(w,w,false)
		chartWidth = .85*w/3
		chartHeight = .8 * chartWidth;


	}

	
}

function sSet(sketch,strat) {
	sketch.sStratPick(strat)
}

function rSet(sketch,strat) {
	sketch.rStratPick(strat)
}

function playButton(button,sketch) {
	if (sketch.isLooping()) {
			button.firstChild.data = "Start";  //▶
			sketch.noLoop();
		} else {
			button.firstChild.data = "Stop"; //"⏸";
			sketch.loop();
		}
}

function resetButton(sketch) {
	sketch.startOver();
}

//(s, withCharts, sLearning, rLearning, showMessages, allStrats, withForgetting)

// No messages
let sr_NoMessages = new p5((s) => srSim(s,false, false, false, false, false), 'sr-no-messages-div')

// Given meaning
let sr_Given = new p5((s) => srSim(s,true,false,false,true,false,false), 'sr-given-meaning-div')

// R learning only
let sr_rLearn = new p5((s) => srSim(s,true,false,true,true,false,false), 'sr-rlearn-div')

// S learning only
let sr_sLearn = new p5((s) => srSim(s,true,true,false,true,false,false), 'sr-slearn-div')

// Both learning 
let sr_bothLearn = new p5((s) => srSim(s,true, true, true, true, false, false), 'sr-both-learn-div')

// Both learning, all strats
let sr_allStrats = new p5((s) => srSim(s, true, true, true, true, true, false), 'sr-all-strats-div')

// Both learning, all strats, forgetting
let sr_forgetting = new p5((s) => srSim(s, true, true, true, true, true, true), 'sr-forgetting-div')
