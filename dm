<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>常见植物科普网</title>
    <style>
        :root {
            --primary-green: #7C9D8E;
            --light-green: #A8C1B4;
            --pale-green: #F0F4F1;
            --accent-green: #94B0A9;
            --text-color: #4A5D54;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 10% 20%, var(--pale-green) 1px, transparent 1px),
                radial-gradient(circle at 90% 80%, var(--pale-green) 1px, transparent 1px);
            background-size: 50px 50px;
            opacity: 0.3;
            z-index: -1;
        }

        body {
            font-family: 'Microsoft YaHei', sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--pale-green);
            color: #333;
        }

        .container {
            position: relative;
            background-color: rgba(255, 255, 255, 0.95);
        }

        .container::before,
        .container::after {
            content: '';
            position: absolute;
            width: 50px;
            height: 50px;
            border: 2px solid var(--light-green);
            opacity: 0.6;
        }

        .container::before {
            top: 20px;
            left: 20px;
            border-right: none;
            border-bottom: none;
        }

        .container::after {
            bottom: 20px;
            right: 20px;
            border-left: none;
            border-top: none;
        }

        header {
            background: linear-gradient(135deg, var(--primary-green), var(--light-green));
            color: white;
            padding: 40px 0;
            text-align: center;
            position: relative;
        }

        header::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 5px;
            background-color: var(--light-green);
        }

        h1 {
            margin: 0;
            font-size: 2.5em;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }

        nav {
            background: var(--primary-green);
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 15px 0;
        }

        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            gap: 30px;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 5px 15px;
            border-radius: 20px;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: var(--primary-green);
        }

        main {
            padding: 30px;
        }

        .plant-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
        }

        .plant-card {
            position: relative;
            overflow: hidden;
            background-color: rgba(255, 255, 255, 0.9);
            border: 1px solid var(--light-green);
            border-radius: 10px;
            padding: 20px;
            transition: transform 0.3s;
        }

        .plant-card:hover {
            transform: translateY(-5px);
        }

        .plant-card::before {
            content: '🌿';
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 20px;
            opacity: 0.2;
        }

        .view-more {
            background: linear-gradient(135deg, var(--primary-green), var(--light-green));
            border: none;
            padding: 10px 20px;
            color: white;
            border-radius: 25px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .view-more:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
        }

        nav ul li a {
            position: relative;
        }

        nav ul li a::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 50%;
            width: 0;
            height: 2px;
            background: white;
            transition: all 0.3s ease;
            transform: translateX(-50%);
        }

        nav ul li a:hover::after {
            width: 100%;
        }

        /* 轮播图样式 */
        .slideshow-container {
            max-width: 100%;
            position: relative;
            margin: 40px auto 20px;
            overflow: hidden;
            height: 400px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        }

        .slides {
            display: flex;
            transition: transform 0.5s ease;
            height: 100%;
        }

        .slide {
            min-width: 100%;
            height: 100%;
        }

        .slide img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            padding: 16px;
            color: var(--primary-green);
            font-weight: bold;
            font-size: 24px;
            transition: 0.3s ease;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.8);
            border: 1px solid var(--light-green);
            z-index: 1;
        }

        .prev { left: 20px; }
        .next { right: 20px; }

        .prev:hover, .next:hover {
            background: var(--light-green);
            color: white;
        }

        .dots {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 8px;
        }

        .dot {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background: var(--light-green);
            opacity: 0.5;
            cursor: pointer;
            transition: opacity 0.3s ease;
        }

        .dot.active {
            opacity: 1;
        }

        .slideshow-title {
            text-align: center;
            color: var(--primary-green);
            margin-top: 40px;
            margin-bottom: 20px;
            font-size: 1.8em;
            position: relative;
            display: inline-block;
            padding-bottom: 10px;
        }

        .slideshow-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 2px;
            background: var(--light-green);
        }

        .games-section {
            padding: 40px 20px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            margin-top: 40px;
        }

        .section-title {
            text-align: center;
            color: var(--primary-green);
            margin-bottom: 30px;
        }

        .game-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            border: 1px solid var(--light-green);
        }

        .game-card h3 {
            color: var(--primary-green);
            margin-top: 0;
        }

        .game-button {
            background: var(--light-green);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .game-button:hover {
            background: var(--primary-green);
            transform: translateY(-2px);
        }

        .memory-game {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
            margin: 20px 0;
        }

        .memory-card {
            aspect-ratio: 1;
            background: var(--pale-green);
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .memory-card.flipped {
            transform: rotateY(180deg);
        }

        .quiz-container {
            margin: 20px 0;
        }

        .quiz-option {
            background: var(--pale-green);
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .quiz-option:hover {
            background: var(--light-green);
            color: white;
        }

        #result {
            margin-top: 15px;
            font-weight: bold;
            text-align: center;
        }

        .ai-assistant-section {
            padding: 40px 20px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            margin-top: 40px;
            margin-bottom: 40px;
        }

        .chat-container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            border: 1px solid var(--light-green);
        }

        .chat-messages {
            height: 400px;
            overflow-y: auto;
            padding: 20px;
        }

        .message {
            display: flex;
            align-items: flex-start;
            margin-bottom: 15px;
            animation: fadeIn 0.3s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .message.user {
            flex-direction: row-reverse;
        }

        .avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--pale-green);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 10px;
            font-size: 20px;
        }

        .message.user .avatar {
            background: var(--light-green);
        }

        .text {
            background: var(--pale-green);
            padding: 12px;
            border-radius: 12px;
            max-width: 70%;
            line-height: 1.5;
        }

        .message.user .text {
            background: var(--light-green);
            color: white;
        }

        .chat-input {
            display: flex;
            padding: 15px;
            border-top: 1px solid var(--pale-green);
        }

        .chat-input input {
            flex: 1;
            padding: 10px;
            border: 1px solid var(--light-green);
            border-radius: 20px;
            margin-right: 10px;
            font-size: 16px;
        }

        .send-button {
            background: var(--light-green);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .send-button:hover {
            background: var(--primary-green);
        }

        .quick-questions {
            padding: 15px;
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            justify-content: center;
            border-top: 1px solid var(--pale-green);
        }

        .quick-questions button {
            background: var(--pale-green);
            border: 1px solid var(--light-green);
            padding: 8px 15px;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s;
            color: var(--text-color);
        }

        .quick-questions button:hover {
            background: var(--light-green);
            color: white;
        }

        .floating-assistant {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 300px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 20px rgba(0,0,0,0.2);
            z-index: 1000;
            display: none;
            border: 1px solid var(--light-green);
            transition: all 0.3s ease;
        }

        .assistant-header {
            background: var(--primary-green);
            color: white;
            padding: 12px;
            border-radius: 12px 12px 0 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: move;
        }

        .header-buttons {
            display: flex;
            gap: 8px;
        }

        .minimize-btn, .close-btn {
            background: none;
            border: none;
            color: white;
            cursor: pointer;
            font-size: 16px;
            padding: 0 5px;
            transition: all 0.3s;
        }

        .minimize-btn:hover, .close-btn:hover {
            opacity: 0.8;
        }

        .assistant-body {
            height: 400px;
            display: flex;
            flex-direction: column;
        }

        .chat-messages {
            flex: 1;
            overflow-y: auto;
            padding: 15px;
        }

        .assistant-trigger {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: var(--primary-green);
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 30px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            z-index: 999;
            transition: all 0.3s ease;
        }

        .assistant-trigger:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        .trigger-icon {
            font-size: 20px;
        }

        /* 调整聊天界面样式 */
        .chat-input {
            padding: 10px;
            border-top: 1px solid var(--pale-green);
        }

        .quick-questions {
            padding: 10px;
            display: flex;
            flex-wrap: wrap;
            gap: 5px;
            border-top: 1px solid var(--pale-green);
        }

        .quick-questions button {
            font-size: 12px;
            padding: 5px 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>常见植物科普网</h1>
        </header>
        <nav>
            <ul>
                <li><a href="#home">首页</a></li>
                <li><a href="plant-guide.html">植物图鉴</a></li>
                <li><a href="gardening-tips.html">园艺技巧</a></li>
                <li><a href="#about">关于我们</a></li>
            </ul>
        </nav>
        <main>
            <div class="plant-grid">
                <div class="plant-card">
                    <h2>室内植物</h2>
                    <p>适合室内种植的观赏植物介绍</p>
                    <a href="indoor-plants.html" style="
                        display: inline-block;
                        margin-top: 10px;
                        padding: 8px 15px;
                        background-color: var(--light-green);
                        color: white;
                        text-decoration: none;
                        border-radius: 5px;
                        transition: background-color 0.3s;">
                        查看详情
                    </a>
                </div>
                <div class="plant-card">
                    <h2>户外植物</h2>
                    <p>庭院和阳台合种植的植物</p>
                    <a href="outdoor-plants.html" style="
                        display: inline-block;
                        margin-top: 10px;
                        padding: 8px 15px;
                        background-color: var(--light-green);
                        color: white;
                        text-decoration: none;
                        border-radius: 5px;
                        transition: background-color 0.3s;">
                        查看详情
                    </a>
                </div>
                <div class="plant-card">
                    <h2>多肉植物</h2>
                    <p>各类多肉植物的养护指南</p>
                    <a href="succulent-plants.html" style="
                        display: inline-block;
                        margin-top: 10px;
                        padding: 8px 15px;
                        background-color: var(--light-green);
                        color: white;
                        text-decoration: none;
                        border-radius: 5px;
                        transition: background-color 0.3s;">
                        查看详情
                    </a>
                </div>
            </div>

            <h2 class="slideshow-title">植物科普绘本</h2>

            <div class="slideshow-container">
                <div class="slides">
                    <div class="slide"><img src="images/绘本1.png" alt="绘本1"></div>
                    <div class="slide"><img src="images/绘本2.png" alt="绘本2"></div>
                    <div class="slide"><img src="images/绘本3.png" alt="绘本3"></div>
                    <div class="slide"><img src="images/绘本4.png" alt="绘本4"></div>
                    <div class="slide"><img src="images/绘本5.png" alt="绘本5"></div>
                    <div class="slide"><img src="images/绘本6.png" alt="绘本6"></div>
                    <div class="slide"><img src="images/绘本7.png" alt="绘本7"></div>
                    <div class="slide"><img src="images/绘本8.png" alt="绘本8"></div>
                    <div class="slide"><img src="images/绘本9.png" alt="绘本9"></div>
                    <div class="slide"><img src="images/绘本10.png" alt="绘本10"></div>
                    <div class="slide"><img src="images/绘本11.png" alt="绘本11"></div>
                    <div class="slide"><img src="images/绘本12.png" alt="绘本12"></div>
                    <div class="slide"><img src="images/绘本13.png" alt="绘本13"></div>
                    <div class="slide"><img src="images/绘本14.png" alt="绘本14"></div>
                </div>
                <button class="prev">❮</button>
                <button class="next">❯</button>
                <div class="dots"></div>
            </div>

            <section class="games-section">
                <h2 class="section-title">趣味植物小游戏</h2>
                
                <!-- 植物配对游戏 -->
                <div class="game-card">
                    <h3>植物配对游戏</h3>
                    <p>考验记忆力，找出相同的植物图片</p>
                    <div class="memory-game" id="memoryGame">
                        <!-- 游戏卡片将通过JS动态生成 -->
                    </div>
                    <button class="game-button" onclick="startMemoryGame()">开始游戏</button>
                </div>

                <!-- 植物知识问答 -->
                <div class="game-card">
                    <h3>植物知识问答</h3>
                    <p>测试你的植物知识</p>
                    <div class="quiz-container" id="quizContainer">
                        <div id="question"></div>
                        <div id="options"></div>
                        <div id="result"></div>
                    </div>
                    <button class="game-button" onclick="startQuiz()">开始答题</button>
                </div>
            </section>

            <div class="floating-assistant" id="floatingAssistant">
                <div class="assistant-header">
                    <span class="assistant-title">🌱 植物科普助手</span>
                    <div class="header-buttons">
                        <button class="minimize-btn" onclick="toggleAssistant()">_</button>
                        <button class="close-btn" onclick="closeAssistant()">×</button>
                    </div>
                </div>
                <div class="assistant-body">
                    <div class="chat-messages" id="chatMessages">
                        <div class="message bot">
                            <div class="avatar">🌱</div>
                            <div class="text">你好！我是植物科普助手，很高兴为您解答关于植物的问题。</div>
                        </div>
                    </div>
                    <div class="chat-input">
                        <input type="text" id="userInput" placeholder="请输入您的问题...">
                        <button onclick="sendMessage()" class="send-button">发送</button>
                    </div>
                    <div class="quick-questions">
                        <button onclick="askQuestion('如何养护多肉植物？')">多肉养护</button>
                        <button onclick="askQuestion('室内植物怎么浇水？')">浇水方法</button>
                        <button onclick="askQuestion('植物黄叶怎么办？')">黄叶处理</button>
                        <button onclick="askQuestion('新手适合养什么植物？')">新手指南</button>
                        <button onclick="askQuestion('哪些植物能净化空气？')">净化空气</button>
                    </div>
                </div>
            </div>

            <button class="assistant-trigger" onclick="toggleAssistant()" id="assistantTrigger">
                <span class="trigger-icon">🌱</span>
                <span class="trigger-text">植物助手</span>
            </button>
        </main>
    </div>
    <script>
        const slides = document.querySelector('.slides');
        const slideItems = document.querySelectorAll('.slide');
        const prevBtn = document.querySelector('.prev');
        const nextBtn = document.querySelector('.next');
        const dotsContainer = document.querySelector('.dots');
        
        let currentSlide = 0;
        const totalSlides = slideItems.length;

        // 创建导航点
        slideItems.forEach((_, index) => {
            const dot = document.createElement('div');
            dot.classList.add('dot');
            if (index === 0) dot.classList.add('active');
            dot.addEventListener('click', () => goToSlide(index));
            dotsContainer.appendChild(dot);
        });

        const dots = document.querySelectorAll('.dot');

        // 更新导航点状态
        function updateDots() {
            dots.forEach((dot, index) => {
                dot.classList.toggle('active', index === currentSlide);
            });
        }

        // 切换到指定幻灯片
        function goToSlide(index) {
            currentSlide = index;
            slides.style.transform = `translateX(-${currentSlide * 100}%)`;
            updateDots();
        }

        // 下一张幻灯片
        function nextSlide() {
            currentSlide = (currentSlide + 1) % totalSlides;
            goToSlide(currentSlide);
        }

        // 上一张幻灯片
        function prevSlide() {
            currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
            goToSlide(currentSlide);
        }

        // 添加按钮事件监听
        prevBtn.addEventListener('click', prevSlide);
        nextBtn.addEventListener('click', nextSlide);

        // 自动播放
        let slideInterval = setInterval(nextSlide, 5000);

        // 鼠标悬停时暂停自动播放
        const slideshow = document.querySelector('.slideshow-container');
        slideshow.addEventListener('mouseenter', () => clearInterval(slideInterval));
        slideshow.addEventListener('mouseleave', () => {
            slideInterval = setInterval(nextSlide, 5000);
        });

        // 植物配对游戏数据
        const plantPairs = [
            {name: '绿萝', image: 'images/lvluo.jpg'},
            {name: '多肉', image: 'images/lhz.jpg'},
            {name: '绣球', image: 'images/绘本1.png'},
            {name: '月季', image: 'images/绘本2.png'},
            {name: '茉莉', image: 'images/绘本3.png'},
            {name: '散尾葵', image: 'images/绘本4.png'}
        ];

        // 植物知识问答数据
        const quizQuestions = [
            {
                question: '以下哪种植物最适合室内养护？',
                options: ['绿萝', '向日葵', '牡丹', '月季'],
                correct: 0
            },
            {
                question: '多肉植物喜欢怎样的浇水方式？',
                options: ['每天浇水', '看土干了再浇', '一周浇一次', '半个月浇一次'],
                correct: 1
            },
            {
                question: '以下哪种植物最耐阴？',
                options: ['仙人掌', '虎皮兰', '向日葵', '月季'],
                correct: 1
            }
        ];

        function startMemoryGame() {
            const memoryGame = document.getElementById('memoryGame');
            memoryGame.innerHTML = '';
            
            // 创建配对卡片
            const cards = [...plantPairs, ...plantPairs].sort(() => Math.random() - 0.5);
            cards.forEach((plant, index) => {
                const card = document.createElement('div');
                card.className = 'memory-card';
                card.dataset.index = index;
                card.dataset.name = plant.name;
                card.onclick = flipCard;
                memoryGame.appendChild(card);
            });
        }

        let flippedCards = [];
        function flipCard() {
            if (flippedCards.length === 2) return;
            if (this.classList.contains('flipped')) return;
            
            this.style.background = `url(${plantPairs.find(p => p.name === this.dataset.name).image}) center/cover`;
            this.classList.add('flipped');
            flippedCards.push(this);

            if (flippedCards.length === 2) {
                setTimeout(checkMatch, 1000);
            }
        }

        function checkMatch() {
            const [card1, card2] = flippedCards;
            const match = card1.dataset.name === card2.dataset.name;
            
            if (match) {
                card1.style.opacity = '0.7';
                card2.style.opacity = '0.7';
                card1.onclick = null;
                card2.onclick = null;
                flippedCards = [];
            } else {
                setTimeout(() => {
                    card1.style.background = '';
                    card2.style.background = '';
                    card1.classList.remove('flipped');
                    card2.classList.remove('flipped');
                    flippedCards = [];
                }, 500);
            }
        }

        function startQuiz() {
            let currentQuestion = 0;
            const quizContainer = document.getElementById('quizContainer');
            const questionEl = document.getElementById('question');
            const optionsEl = document.getElementById('options');
            const resultEl = document.getElementById('result');

            function showQuestion() {
                const q = quizQuestions[currentQuestion];
                questionEl.textContent = q.question;
                optionsEl.innerHTML = '';
                q.options.forEach((option, index) => {
                    const button = document.createElement('div');
                    button.className = 'quiz-option';
                    button.textContent = option;
                    button.onclick = () => checkAnswer(index);
                    optionsEl.appendChild(button);
                });
                resultEl.textContent = '';
            }

            function checkAnswer(answer) {
                const correct = quizQuestions[currentQuestion].correct;
                if (answer === correct) {
                    resultEl.textContent = '回答正确！';
                    resultEl.style.color = 'green';
                } else {
                    resultEl.textContent = '回答错误，请重试！';
                    resultEl.style.color = 'red';
                }
                setTimeout(() => {
                    currentQuestion = (currentQuestion + 1) % quizQuestions.length;
                    showQuestion();
                }, 1500);
            }

            showQuestion();
        }

        // 植物知识库
        const plantKnowledge = {
            '多肉植物': {
                '养护': '多肉植物喜欢充足的光照，但要避免烈日直射。浇水要遵循"宁干勿湿"的原则，土壤完全干燥后再浇水。',
                '浇水': '多肉植物浇水要适量，一般7-10天浇一次水，具体要根据季节和环境调整。夏季可以适当增加浇水频率，冬季则要减少。',
                '光照': '多肉植物需要充足的散射光，早晚各2-3小时的直射阳光最佳。秋冬季节要增加光照时间。',
                '土壤': '多肉植物需要疏松透气的土壤，可以使用专用多肉土，或混合泥炭土、珍珠岩和河沙。',
                '繁殖': '多肉植物可以通过叶插、扦插、分株等方式进行繁殖，春季和秋季是最佳繁殖时间。'
            },
            '室内植物': {
                '浇水': '室内植物浇水要根据不同植物的需求来定，一般是看表土干了再浇水，浇透不浇满。早晚浇水效果最好。',
                '光照': '大多数室内植物喜欢明亮的散射光，避免强光直射。可以根据叶片颜色判断光照是否合适。',
                '施肥': '生长季节每月施肥1-2次，冬季可以停止施肥。使用薄肥多施的原则，避免烧根。',
                '换盆': '当植物根系从排水孔长出或生长明显变慢时，就需要换盆。一般春季换盆最适宜。',
                '修剪': '定期修剪可以保持植物形态美观，促进分枝。修剪时要用清洁的工具，避免感染。'
            },
            '常见问题': {
                '黄叶': '植物黄叶可能是因为浇水过多、光照不足、营养不良等原因。建议检查根系状况，调整浇水和光照条件。',
                '烂根': '烂根主要是因为浇水过多或排水不良导致，要及时处理并调整浇水方式。可以适当添加珍珠岩改善排水。',
                '虫害': '发现虫害要及时隔离植物，可以用温和的杀虫剂或天然驱虫方法处理。预防胜于治疗，要定期检查植物。',
                '徒长': '植物徒长通常是因为光照不足，需要调整植物位置，增加光照时间。',
                '叶尖发黑': '叶尖发黑可能是缺水或空气湿度过低，可以增加浇水频率或使用加湿器。'
            },
            '养护技巧': {
                '日常管理': '定期观察植物状态，保持盆土适度湿润，适时修剪整形，保持环境通风。',
                '季节变化': '根据季节调整浇水频率和光照时间，冬季注意保暖，夏季注意遮阳和通风。',
                '环境要求': '室内温度最好保持在18-25℃，相对湿度在40-60%，避免空调直吹。',
                '工具使用': '使用专业的园艺工具，如剪刀、铲子等，使用前要消毒，使用后要清洁。',
                '肥料选择': '根据植物生长阶段选择合适的肥料，生长期使用氮肥，开花期使用磷钾肥。'
            },
            '植物选择': {
                '新手入门': '建议选择好养活的植物，如绿萝、常春藤、龟背竹等，这些植物适应能力强。',
                '净化空气': '常见的室内空气净化植物有绿萝、虎尾兰、吊兰、芦荟等，可以吸收甲醛等有害物质。',
                '观花植物': '适合室内种植的观花植物有蝴蝶兰、一品红、茉莉花等，需要注意光照和温度要求。',
                '观叶植物': '常见的观叶植物有龟背竹、橡皮树、发财树等，主要观赏其叶片形态和颜色。',
                '阳台种植': '阳台适合种植向日葵、月季、绣球等喜光植物，注意防风和排水。'
            }
        };

        function sendMessage() {
            const input = document.getElementById('userInput');
            const message = input.value.trim();
            if (message) {
                addMessage(message, 'user');
                generateResponse(message);
                input.value = '';
            }
        }

        function askQuestion(question) {
            addMessage(question, 'user');
            generateResponse(question);
        }

        function addMessage(text, sender) {
            const messages = document.getElementById('chatMessages');
            const messageDiv = document.createElement('div');
            messageDiv.className = `message ${sender}`;
            messageDiv.innerHTML = `
                <div class="avatar">${sender === 'user' ? '👤' : '🌱'}</div>
                <div class="text">${text}</div>
            `;
            messages.appendChild(messageDiv);
            messages.scrollTop = messages.scrollHeight;
        }

        function generateResponse(question) {
            let response = '抱歉，我暂时无法回答这个问题。请尝试询问有关植物养护、浇水、光照等方面的问题。';
            
            for (const [key, [category, subcategory]] of Object.entries(keywords)) {
                if (question.toLowerCase().includes(key)) {
                    if (plantKnowledge[category] && plantKnowledge[category][subcategory]) {
                        response = plantKnowledge[category][subcategory];
                        break;
                    }
                }
            }

            setTimeout(() => {
                addMessage(response, 'bot');
            }, 500);
        }

        // 添加回车发送功能
        document.getElementById('userInput').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                sendMessage();
            }
        });

        // 控制助手显示/隐藏
        function toggleAssistant() {
            const assistant = document.getElementById('floatingAssistant');
            const trigger = document.getElementById('assistantTrigger');
            if (assistant.style.display === 'none' || !assistant.style.display) {
                assistant.style.display = 'block';
                trigger.style.display = 'none';
            } else {
                assistant.style.display = 'none';
                trigger.style.display = 'flex';
            }
        }

        function closeAssistant() {
            document.getElementById('floatingAssistant').style.display = 'none';
            document.getElementById('assistantTrigger').style.display = 'flex';
        }

        // 使助手可拖动
        const assistantHeader = document.querySelector('.assistant-header');
        const floatingAssistant = document.getElementById('floatingAssistant');
        let isDragging = false;
        let currentX;
        let currentY;
        let initialX;
        let initialY;
        let xOffset = 0;
        let yOffset = 0;

        assistantHeader.addEventListener('mousedown', dragStart);
        document.addEventListener('mousemove', drag);
        document.addEventListener('mouseup', dragEnd);

        function dragStart(e) {
            initialX = e.clientX - xOffset;
            initialY = e.clientY - yOffset;

            if (e.target === assistantHeader) {
                isDragging = true;
            }
        }

        function drag(e) {
            if (isDragging) {
                e.preventDefault();
                currentX = e.clientX - initialX;
                currentY = e.clientY - initialY;
                xOffset = currentX;
                yOffset = currentY;
                setTranslate(currentX, currentY, floatingAssistant);
            }
        }

        function setTranslate(xPos, yPos, el) {
            el.style.transform = `translate3d(${xPos}px, ${yPos}px, 0)`;
        }

        function dragEnd() {
            initialX = currentX;
            initialY = currentY;
            isDragging = false;
        }
    </script>
</body>
</html>
