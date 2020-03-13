import Typed from 'typed.js';

const loadDynamicFormText = () => {
  new Typed('.banner-typed-text', {
    strings: ["Bloody Mary", "Margarita"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicFormText };
