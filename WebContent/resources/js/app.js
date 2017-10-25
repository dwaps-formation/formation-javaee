// starting code
(new Dwaps()).run();


// constants
const HOME = 0, APP = 1;
const SECTIONS = [
	document.querySelector('#home-section'),
	document.querySelector('#app-section')
];
const SECTION_SHOWN = "Section active"; // For localStorage
const IS_SHOWN = 'section shown';

// main class
function Dwaps() {
	this.homeCard = document.querySelector('#home-section .card');
	this.mp3Player = document.querySelector('#home-section audio');
	this.input = document.querySelector('#app-section input');
	this.submit = document.querySelector('#app-section button');
	this.navAllowed = true;
	
	this.run =_=> {
		document.addEventListener('DOMContentLoaded', this.start, false);
	};
	this.start =_=> {
		// initialisations
		let THIS = this;
		
		this.mp3Player.load();
		this.mp3Player.volume = 0.1;
		
		adminRightsOfNavigation(this.input);
		adminRightsOfNavigation(this.submit);
		
		function adminRightsOfNavigation(el) {
			el.addEventListener(
				'click',
				_ => {
					THIS.navAllowed = false;
				}
			);
			el.addEventListener(
					'blur',
					_ => {
						THIS.navAllowed = true;
					}
			);
		}

		// If not localStorage => displaying home page of app
		if (!localStorage.getItem(SECTION_SHOWN)) {
			this.sectionSwitcher(false);
		} else {
			let fromHome = !this.homeSectionIsActiveView();
			this.sectionSwitcher(fromHome);
		}
		
		this.handleSound();
		this.navigation();
	};
	
	
	/* --------- */
	/* FUNCTIONS */
	/* --------- */
	
	// ADMIN SOUND PLAYER
	this.handleSound =_=> {
		let isPlaying, play;
		
		this.homeCard.addEventListener(
			'click',
			_ => {
				this.mp3Player.pause();
				this.mp3Player.load();
			}
		);
		this.homeCard.addEventListener(
			'mouseover',
			_ => {
				if (!isPlaying) {
					play = this.mp3Player.play();
					isPlaying = true;
				}
				
				if (undefined != play) {
					play
						.then(
							_ => {
								console.log("mp3 playing...");
							}
						).catch(
							error => {
								console.log(error);
								this.mp3Player.pause();
								this.mp3Player.load();
							}
						)
					;
				}
				
				setTimeout(
					_ => {
						if(this.isShown(HOME)) {
							isPlaying = false;
						}
					},
					this.mp3Player.duration
				);
			}
		);
		this.homeCard.addEventListener(
			'mouseout',
			_ => {
				if (!isPlaying) {
					this.mp3Player.pause();
					this.mp3Player.load();
				}
			}
		);
	};
	
	// NAVIGATION
	this.navigation =_=> {
		SECTIONS.forEach(
			s => {
				s.addEventListener(
					'click',
					_ => {
						if (this.navAllowed) {
							let fromHome = this.homeSectionIsActiveView();
							this.sectionSwitcher(fromHome);
						}
					}
				);
			}
		);
	};
	this.homeSectionIsActiveView =_=> {
		let sectionShown = localStorage.getItem(SECTION_SHOWN);
		return sectionShown == HOME ? true : false;
	};
	this.sectionSwitcher = (fromHome) => {
		if (fromHome) {
			SECTIONS[HOME].className = 'section';
			SECTIONS[APP].className = 'section shown';
			localStorage.setItem(SECTION_SHOWN, APP);
		} else {
			SECTIONS[HOME].className = 'section shown';
			SECTIONS[APP].className = 'section';
			localStorage.setItem(SECTION_SHOWN, HOME);
		}
	};
	this.isShown = (s) => {
		return SECTIONS[s].className == IS_SHOWN;
	};
};