import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if (document.getElementById("banner-typed-text")) {
    new Typed('#banner-typed-text', {
      strings: ["Create your own cocktail", "Mojito", "Caipirina", "And much more!"],
      typeSpeed: 50,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
