function showSidebar(){
    const sidebar = document.querySelector('.sidebar')
    sidebar.style.display= 'flex'
}

function hideSidebar(){
    const sidebar = document.querySelector('.sidebar')
    sidebar.style.display= 'none'
}




const container = document.getElementById('container');
const registerBtn = document.getElementById('register');
const loginBtn = document.getElementById('login');

registerBtn.addEventListener('click', () => {
    container.classList.add("active");
});

loginBtn.addEventListener('click', () => {
    container.classList.remove("active");
});

document.getElementById('signupForm').addEventListener('submit', function(event) {
    event.preventDefault();
    var name = document.getElementById('signupName').value;
    var username = document.getElementById('signupUsername').value;
    var email = document.getElementById('signupEmail').value;
    var password = document.getElementById('signupPassword').value;
    fetch('signup.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({name: name, username: username, email: email, password: password}),
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            window.location.href = '../src/index.html'; // Redirect to the homepage
        } else {
            document.getElementById('errorMessage').textContent = 'Sign in failed'; // Show an error message
        }
    });
});

document.getElementById('signinForm').addEventListener('submit', function(event) {
    event.preventDefault();
    var email = document.getElementById('signinEmail').value;
    var password = document.getElementById('signinPassword').value;
    fetch('signin.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({email: email, password: password}),
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            window.location.href = '../src/index.html'; // Redirect to the homepage
        } else {
            document.getElementById('errorMessage').textContent = 'Sign in failed'; // Show an error message
        }
    });
});