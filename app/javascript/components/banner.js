import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if (document.getElementById("banner-typed-text")) {
    new Typed('#banner-typed-text', {
      strings: ["MONURENT", "Rent a monument", "For you events"],
      typeSpeed: 50,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
