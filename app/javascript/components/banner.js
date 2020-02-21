import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if (document.getElementById("banner-typed-text")) {
    new Typed('#banner-typed-text', {
      strings: ['Find a monument', 'And rent it!'],
      typeSpeed: 50,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
