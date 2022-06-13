import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "tab", "content" ]

  connect() {
    this.outputTarget.textContent = 'Hello, Stimulus!'
  }
  switch(event) {
    const tabId = event.currentTarget.id
    this.tabTargets.forEach((tab) => {
      tab.classList.remove('is-active')
    })
    event.currentTarget.classList.add('is-active')
    this.contentTargets.forEach(content => {
      content.classList.remove('is-active')
      if (content.id == tabId) {
        content.classList.add('is-active')
      }
    })
  }
}

// let tabs = document.querySelectorAll('.tabs__toggle'),
//     content = document.querySelectorAll('.tabs__content');

// tabs.forEach((tab, index)) => {
//   tab.addEventListener('click', () => {
//     contents.forEach((content) => {
//       contents.classList.remove('is-active');
//     });
//     tabs.forEach((tab) => {
//       tab.classList.remove('is-active');
//     });
//     contents[index].classList.add('is-active');
//     tabs[index].classList.add('is-active');
//   });
// });
