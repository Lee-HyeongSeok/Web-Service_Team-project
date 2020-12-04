function removePostEventListener(postId) {
    if (confirm("정말로 삭제 하시겠습니까?")) {
        document.location = "delete_post_process.jsp?postId=" + postId;
    }
}

function updatePostEventListener(postId) {
    if (confirm("정말로 수정 하시겠습니까?")) {
        document.location = "boardUpdate.jsp?postId=" + postId;
    }
}

