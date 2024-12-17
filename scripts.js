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
