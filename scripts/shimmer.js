// staggered reveal
const entries = document.querySelectorAll('.entry');
entries.forEach((entry, i) => {
  setTimeout(() => {
    entry.classList.add('visible');
  }, 500 + i * 500);
});

// audio toggle
const hum = document.getElementById('hum');
const toggleBtn = document.getElementById('toggle-audio');
toggleBtn.addEventListener('click', () => {
  if (hum.muted) {
    hum.muted = false;
    toggleBtn.textContent = '🔊 mute hum';
  } else {
    hum.muted = true;
    toggleBtn.textContent = '🔇 unmute hum';
  }
});
