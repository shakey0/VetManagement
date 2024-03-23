// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

// Create a script element
var script = document.createElement("script");

// Set the source of the script to the Bootstrap JS URL
script.src = "https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js";

// Use the integrity and crossorigin attributes for security
script.integrity = "sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM";
script.crossOrigin = "anonymous";

// Append the script element to the document's body or head
document.body.appendChild(script);


document.addEventListener("turbo:load", function() {

    const loginBoxError = document.getElementById('login-box-error');
    if (loginBoxError) {
        console.log('Current error text:', loginBoxError.textContent);
        if (loginBoxError.textContent === "Invalid Email or password.") {
            loginBoxError.textContent = "Invalid credentials.";
        } else {
            loginBoxError.textContent = "";
        }
    }

    const loginForm = document.getElementById('login-form');
    loginForm.addEventListener('submit', function(event) {
        const email = document.querySelector('[name="user[email]"]').value.trim();
        const password = document.querySelector('[name="user[password]"]').value.trim();
        const errorBox = document.getElementById('empty-box-error');
        errorBox.textContent = '';
    
        if (!email && !password) {
            errorBox.textContent = 'Enter your details';
            event.preventDefault();
        } else if (!email) {
            errorBox.textContent = 'Enter your email';
            event.preventDefault();
        } else if (!password) {
            errorBox.textContent = 'Enter your password';
            event.preventDefault();
        }
    });

});
