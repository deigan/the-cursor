#lang pollen

h1, h2, h3, h4, h5, h6 {
  margin-top: 0;
  font-family: "Roboto Mono", monospace;
}

footer {
	text-align: right;
	}

blockquote {
	font-size: .9rem;
	line-height: 1.5;
	margin-inline-start: 10px;
	margin-inline-end: 0;
	padding: 3em;
	border-style: dashed;
	border-width: .1em;
	border-color: black;
}

sup {
  vertical-align: top;
  position: relative;
  top: -.5em;
}

h4 {
  margin-top: 2rem;
  margin-bottom: -.75rem;
  }

index-year {
  display: block;
  margin-bottom: 1rem;
  margin-top: 2rem;
  font-family: "Roboto Mono", monospace;
  font-size: 1.25rem;
  }

post {
  display: block;
  font-family: "Roboto Mono", monospace;
  margin: 1rem;
  text-align: left;
  }

.container, .index-container {
  position: relative;
  width: 80%;
  max-width: 1200px;
  margin: 0px;
  padding: 30px;
  box-sizing: border-box;
  }

.index-container {
  max-width: 1400px;
  width: 100%
  }

.subtitle {
  margin-left: 4.4rem;
  font-family: "Roboto Mono";
  line-height: .4rem;
  }

.index-subtitle {
  white-space: pre
  }


.header { 
	width: 24%;
	float: left;
	text-align: right;
	}

.index-header { 
	width: 24%;
	float: left;
	text-align: right;
	font-size: 1.3rem;
	font-family: "Roboto Mono";
	margin-top: 3.0rem;}

.main { width: 65%;}

.index-main { width: 70% }

.main, .index-main {
	float: left;
	padding-left: 40px;
	}

.header, #post-title, #index-title{
	font-size: 1.3rem;
	font-family: "Roboto Mono";
}

#post-title{
	font-size: 1.6em;
	padding-top: 1.3em;
	font-weight: bold;
	}

#index-title{
	white-space: pre;
	font-size: 2rem;
	padding-top: 2.2rem;
	font-weight: bold;
	}

.intermission { 
	text-align: center;
	margin-top: 2rem;
	font-size: 2rem;
	color: #b8b8b8;
	}

end, title-cursor, index-cursor {
	animation:cursor-blink 1.2s 4;
	animation-timing-function: step-start;
	text-shadow: none;
	color: transparent;
	}

end, index-cursor {
	animation-iteration-count: infinite;
	}
end {
	float: right;}


@keyframes cursor-blink {
	0%{ color: grey}
	50%{ color: transparent}
	100%{ color: #b8b8b8}
	}


	

.marginnote { float: right;
              clear: right;
              margin-right: -58%;
              width: 48%;
              margin-top: 0rem;
              margin-bottom: .25rem;
	      padding-right: 30px;
              font-size: .70rem;
              line-height: 1.5;
              vertical-align: baseline;
              position: relative; 
}

.marginlabel { font-size: .8rem;
		line-height: 1;
		top: -.4em;
		}

input.margin-toggle, label.margin-toggle { display: none; }



@media screen and (max-width: 1250px) {
.container {
  width: 90%;
  }
.header, .main, .index-main, .index-header { 
	padding-left: 30px;
	width: 70%;
	}
.index-main { width: 90%}
.header, .index-header {
	width: 100%;
	float: none;
	text-align: left;
	margin-bottom: 0;
	}
#post-title, #index-title{
	padding-top: 0;
	}

}


@media screen and (max-width: 950px) {
  .container {
  width: 95%;
  padding: 25px;
  }

  .index-container {
  	padding: 20px;}

  .main, .header, .index-main, .index-header { 
	padding-left: 20px;
	width: 90%;
  }

  .index-main {
  	width: 95%;
	}

  

  .margin-toggle:checked ~ .marginnote {
		display: block;
		float: left;
                left: 1rem;
                clear: both;
                width: 75%;
                margin: 1rem 15% 1rem 10%;
                vertical-align: baseline;
                position: relative; 
  }
  .marginnote, .margin-note-indicator, .marginlabel { 
	display: none; 
  }
  
   label.margin-toggle { 
		display: inline;
		color: red; 
		cursor: pointer;
		}
}

@media screen and (max-width: 770px) {
.container, .index-container {
  width: 98%;
  padding: 15px;
  }
.main, .header, .index-main, .index-header{ 
	padding-left: 0px;
	width: 95%;
	}

.index-main {
	width: 99%;
	}
.margin-toggle:checked + .marginnote {
width: 85%;
margin: 1rem 15% 1rem 5%;
	}
}

@media screen and (max-width: 500px) {
.container, .index-container {
  width: 98%;
  padding: 5px;
  }
.main, .index-main { 
	padding-left: 0px;
	width: 99%;
	}
}




html {
  font-size: 1.5vw
  }
body {
  line-height: 1.8;
  font-weight: 400;
  font-family: BitterPro;
  color: #000000;
  background-color: #ffffff;
  margin: 1%;
}

/* Smaller than desktop */
@media screen and (max-width: 1250px) {
html {
font-size: 1.9vw
  }
}

/* Smaller than desktop */
@media screen and (max-width: 1100px) {
html {
font-size: 2.5vw
  }
}

@media screen and (max-width: 850px) {
html {
font-size: 2.8vw
  }
}

/* Smaller than tablet */
@media screen and (max-width: 770px) {
html {
  font-size: 3.2vw
  }
}

/* Smaller than phablet  */
@media screen and (max-width: 550px) {
html {
  font-size: 4.5vw
  }
}
/* Smaller than mobile */
@media screen and (max-width: 420px) {
html {
  font-size: 1.4em
  }
}

/*Larger than Desktop HD */
@media (min-width: 1800px) {
html {
  font-size: 1.6em
  }
}




/* Self Clearing Goodness */
.container:after,
.row:after,
.u-cf {
  content: "";
  display: table;
  clear: both; }


::selection {
  background: #e74f24;
  color: #F9F6F0;
  text-shadow: none;
}

::-moz-selection {
  background: #e74f24;
  color: #F9F6F0;
  text-shadow: none;
}  
  

@font-face {
	font-family: "BitterPro";
	src: url("../BitterPro/fonts/otf/BitterPro-Regular.otf")
	}




#post-time{
	text-transform: lowercase;
	text-align: left;
	}
	

#content {
	text-align: justify;
	padding-top: 40px;
	font-family: BitterPro, "Work Sans", "EB Garamond";
	font-weight: 400;
}


a {
text-decoration: none;
    border-bottom: 1px solid #CBF8DF;
    box-shadow: inset 0px -7.5px 0px #CBF8DF;
    background: transparent;
    border-radius: 3px;
    padding-right: 2px;
    padding-left: 2px;
    padding-bottom: 2px;
    color: black;
    transition: background 500ms, box-shadow 500ms;
}

.subscribe, .comment {
	font-size: .75rem;
	margin-top: 2rem;
	margin-bottom: 2rem;
	}

.comment {
	font-style: italic;
	text-align: right;
	}

.subscribe {
	font-family: "Roboto Mono", monospace;
	text-align: left;
	}

.index-subscribe {
margin-top: 4rem;
max-width: 100em;
}

form {
	margin: auto;
	max-width: 22rem;
	}

.subscribe-buttons {
	margin-top: .5rem;
	display: flex;
	justify-content: space-between;
	width: 100%;
	max-width: 25rem;
	height: 2rem;
	line-height: 2rem;
	flex-wrap: wrap;
	}

input {
	font-family: "Roboto Mono", monospace;
	}

input[type=email] {
	width: 98.5%;
	max-width: 25rem;
	font-size: .75rem;	
	height: 2rem;
	margin-top: .75rem;
}

input[type=submit] {
	font-style: italic;
	font-weight: bold;
	flex-grow: 1.75;
	font-size: .9rem;
	background-color: #CBF8DF;
	border-style: solid;
	border-color: black;
	border-width: thin;
	transition: background 500ms;
}	

input[type=submit]:hover {
	transition: background 500ms;
	background-color: #54f979;
	cursor: pointer;
}

.frequency {
	flex-grow: 1;
}

.navbar {
	font-variant: bold;
	text-align: center;
	font-size: 2rem;
}

.navbar a,
post a {
    border-bottom: none;
    box-shadow: none;
    border-radius: 3px;
    padding-right: 4px;
    padding-left: 4px;
    padding-bottom: 4px;
    color: black;
}


.navbar a {
    background: transparent;
    }

a:visited {
	color: black;
	background: #CBF8DF;
	transition: background 500ms, border 500ms, box-shadow 500ms;
	}


a:hover {
	background: #54f979;
	box-shadow: none;
	border-bottom: 1px solid #54f979;
	transition: background 500ms, border 500ms, box-shadow 500ms;
}

.navbar a:hover,
post a:hover {
	border-bottom: none;
	}


.lead-in {
	font-variant: small-caps;
	font-weight: 600;
	}


