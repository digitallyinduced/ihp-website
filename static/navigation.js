document.addEventListener('DOMContentLoaded', function () {
    var rightNavigation = document.getElementById('right-navigation');
    var elements = rightNavigation.querySelectorAll('.nav-link');
    var navigationDropdownContainer = document.querySelector('.navigation-dropdown-container');
    var runningAnimation = null;

    for (let element of elements) {
        element.addEventListener('mouseenter', (function () {
            var element = this;
            clearTimeout(runningAnimation);
            navigationDropdownContainer.classList.remove('will-leave');
            navigationDropdownContainer.classList.add('active');

            for (let el of navigationDropdownContainer.querySelectorAll('.navigation-dropdown > div.active')) { el.classList.remove('active')}
            document.getElementById(element.dataset.show).classList.add('active');
            
        }).bind(element));
    }

    navigationDropdownContainer.addEventListener('mouseleave', function () {
        return;
        navigationDropdownContainer.classList.add('will-leave');
        runningAnimation = setTimeout(function () {
            navigationDropdownContainer.classList.remove('active', 'will-leave');
        }, 200);
    })
});