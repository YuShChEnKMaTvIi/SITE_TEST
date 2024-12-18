const gameContainer = document.getElementById('game-container');
const basket = document.getElementById('basket');
const startButton = document.getElementById('start-button');
const stopButton = document.getElementById('stop-button');
const scoreDisplay = document.getElementById('score');

let gameInterval;
let isGameRunning = false;
let basketPosition;
let score = 0;

// Функция для центрации корзины
function centerBasket() {
  const gameWidth = gameContainer.offsetWidth;
  const basketWidth = basket.offsetWidth; // Ширина корзины (предположим, 100px)
  basketPosition = (gameWidth - basketWidth) / 2; // Центрируем корзину
  basket.style.left = `${basketPosition}px`;
}

// Ініціалізація кошика
centerBasket();  // Центрируем корзину при загрузке

// Оновлення очок
function updateScore(points) {
  score += points;
  scoreDisplay.textContent = `Очки: ${score}`;
}

// Функція для обмеження руху кошика
function moveBasket(event) {
  if (!isGameRunning) return;

  const step = 20; // Крок руху
  const gameWidth = gameContainer.offsetWidth;
  const basketWidth = basket.offsetWidth;

  if (event.key === 'ArrowLeft') {
    // Перевірка лівого обмеження
    if (basketPosition > 0) {
      basketPosition -= step;
    }
  } else if (event.key === 'ArrowRight') {
    // Перевірка правого обмеження
    if (basketPosition < gameWidth - basketWidth) {
      basketPosition += step;
    }
  }

  basket.style.left = `${basketPosition}px`;
}

// Рух кошика за допомогою клавіатури
document.addEventListener('keydown', moveBasket);

// Функція для створення м'яча
function createBall() {
  const ball = document.createElement('div');
  ball.className = 'ball';
  ball.style.left = `${Math.random() * (window.innerWidth - 30)}px`;
  ball.style.top = '0px';
  gameContainer.appendChild(ball);

  const ballFall = setInterval(() => {
    const ballTop = parseInt(ball.style.top, 10);
    ball.style.top = `${ballTop + 5}px`;

    // Перевірка на зіткнення з кошиком
    const basketRect = basket.getBoundingClientRect();
    const ballRect = ball.getBoundingClientRect();
    if (
      ballRect.bottom >= basketRect.top &&
      ballRect.left < basketRect.right &&
      ballRect.right > basketRect.left
    ) {
      clearInterval(ballFall);
      ball.remove();
      updateScore(10); // Додаємо 10 очок за кожний м'яч
    }

    // Видалення м'яча, якщо він виходить за межі
    if (ballTop > window.innerHeight) {
      clearInterval(ballFall);
      ball.remove();
    }
  }, 30);
}

// Почати гру
startButton.addEventListener('click', () => {
  if (isGameRunning) return;

  isGameRunning = true;
  score = 0; // Скидання очок
  updateScore(0);
  centerBasket();  // Центрируем корзину при начале игры
  gameInterval = setInterval(createBall, 1000);
});

// Зупинити гру
stopButton.addEventListener('click', () => {
  isGameRunning = false;
  clearInterval(gameInterval);

  // Видалити всі м'ячі
  const balls = document.querySelectorAll('.ball');
  balls.forEach((ball) => ball.remove());
});

// Функція для показу и скрытия контента
function toggleContent(contentId) {
  var activeContent = document.getElementById(contentId);
  
  if (activeContent.classList.contains('active-content')) {
      // Если видим, скрыть его
      activeContent.classList.remove('active-content');
      activeContent.classList.add('hidden-content');
  } else {
      var contents = document.querySelectorAll('.hidden-content');
      contents.forEach(function(content) {
          content.classList.remove('active-content');
          content.classList.add('hidden-content');
      });
      
      activeContent.classList.remove('hidden-content');
      activeContent.classList.add('active-content');
  }
}
