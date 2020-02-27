// sign up a user
export const postUser = user => (
    $.ajax({
        url: 'api/users',
        method: 'POST',
        data: { user }
    })
);

// login
export const postSession = user => (
    $.ajax({
        url: '/api/session',
        method: 'POST',
        data: { user }
    })
);

// logout
export const deleteSession = user => (
    $.ajax({
        url: '/api/session',
        method: 'DELETE'
    })
)
