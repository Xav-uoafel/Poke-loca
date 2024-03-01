import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card"]

  connect() {
    console.log('hello from card controller')
    this.cardTargets.forEach((container) => {
      container.addEventListener('mousemove', (e) => {
        this.handleMouseMove(e, container)
      });

      container.addEventListener('mouseleave', (e) => {
        this.handleMouseLeave(e, container)
      });
    });
  }

  handleMouseMove(e, container) {
    let layer = container.querySelector('.ex1-layer');
    let constrain = 80;
    let box = layer.getBoundingClientRect();
    let calcX = -(e.clientY - box.y - (box.height / 2)) / constrain;
    let calcY = (e.clientX - box.x - (box.width / 2)) / constrain;
    layer.style.transform = `perspective(100px) rotateX(${calcX}deg) rotateY(${calcY}deg)`;
  }

  handleMouseLeave(e, container) {
    let layer = container.querySelector('.ex1-layer');
    layer.style.transform = 'none';
  }
}
