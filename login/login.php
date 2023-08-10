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
        <h2 class="text-2xl font-bold mb-4">Login</h2>
        <form method="post" action="authenticate.php">
            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Username</label>
                <input type="text" name="username" class="mt-1 p-2 w-full border rounded-md">
            </div>
            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Password</label>
                <input type="password" name="password" class="mt-1 p-2 w-full border rounded-md">
            </div>
            <button type="submit" class="w-full bg-black text-white py-2 rounded">Login</button>
        </form>
        <button class="my-3 w-full bg-gray-500 text-white py-2 rounded"><a href="signup.php">SignUp</a></button>
    </div>

</body>
</html>
