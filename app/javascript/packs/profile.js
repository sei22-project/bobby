window.addEventListener('turbolinks:load', () => {
    if (document.querySelector('.profile__edit-btn')) {
        const editProfileBtn = document.querySelector('.profile__edit-btn');
        const updateProfileBtn = document.querySelector('.profile__update-btn');
        const nameField = document.querySelector('.name__field');
        const avatarField = document.querySelector('.avatar__field');

        const avatarFileInput = document.querySelector('.avatar__file-input');
        const avatarInputDisplay = document.querySelector('.avatar__input-display');

        editProfileBtn.addEventListener('click', () => {
            editProfileBtn.classList.add('hidden');
            updateProfileBtn.classList.remove('hidden');
            nameField.classList.add('border-b');
            avatarField.classList.remove('hidden');
        })

        avatarFileInput.addEventListener('change', (ev) => {
            avatarInputDisplay.innerText = ev.target.value;
            avatarInputDisplay.classList.remove('hidden');
        })
    }
})