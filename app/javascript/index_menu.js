document.addEventListener('DOMContentLoaded', function () {
  const searchMenu = document.querySelector('.search-menu');
  const hiddenMenu = document.querySelector('.lists-left');

  searchMenu.addEventListener('mouseover', function () {
    hiddenMenu.style.display = 'block';
  });

  searchMenu.addEventListener('mouseout', function () {
    hiddenMenu.style.display = 'none';
  });
});