<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <title>CauseID</title>
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">

    <div class="bg-white p-8 rounded shadow-md w-80">
        <h2 class="text-2xl font-bold mb-4">SignUp</h2>
        <form method="post" action="register.php">
            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Username</label>
                <input type="text" name="username" class="mt-1 p-2 w-full border rounded-md">
            </div>
            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">First Name</label>
                <input type="text" name="user_firstname" class="mt-1 p-2 w-full border rounded-md">
            </div>
            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Last Name</label>
                <input type="text" name="user_lastname" class="mt-1 p-2 w-full border rounded-md">
            </div>
            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Password</label>
                <input type="password" name="user_password" class="mt-1 p-2 w-full border rounded-md">
            </div>
            <button type="submit" class="w-full bg-black text-white py-2 rounded">Login</button>
        </form>
    </div>

</body>
</html>
