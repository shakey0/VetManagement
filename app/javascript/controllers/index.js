// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)


document.addEventListener("DOMContentLoaded", function() {

    let isInitialized = false;

    function initialize() {
        if (!isInitialized) {
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
            if (loginForm) {
                loginForm.addEventListener('submit', function(event) {
                    const email = document.querySelector('[name="user[email]"]').value.trim();
                    const password = document.querySelector('[name="user[password]"]').value.trim();
                    const errorBox = document.getElementById('empty-box-error');
                    errorBox.textContent = '';
                
                    if (!email && !password) {
                        errorBox.textContent = 'Enter your details';
                        loginBoxError.textContent = "";
                        event.preventDefault();
                    } else if (!email) {
                        errorBox.textContent = 'Enter your email';
                        loginBoxError.textContent = "";
                        event.preventDefault();
                    } else if (!password) {
                        errorBox.textContent = 'Enter your password';
                        loginBoxError.textContent = "";
                        event.preventDefault();
                    }
                });
            }
        }
    }

    function resetInitialization() {
        isInitialized = false;
    }

    initialize();

    // Listen for both turbo:load and turbo:render events
    document.addEventListener("turbo:load", initialize);
    document.addEventListener("turbo:render", initialize);
    document.addEventListener("turbo:visit", resetInitialization);
    
});