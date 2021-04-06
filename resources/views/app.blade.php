<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HIRADC</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="{{ asset('plugins/fontawesome-free/css/all.min.css') }}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('dist/css/adminlte.min.css') }}">
    <link rel="stylesheet" href="{{ asset('css/app.css') }}" >
</head>

<body class="hold-transition sidebar-mini">
    <main id="app">
        <div class="wrapper">
            <Navigation></Navigation>
            <Sidebar></Sidebar>
            <div class="content-wrapper">
                <router-view></router-view>
            </div>
            <SidebarControl></SidebarControl>
            <Foot></Foot>
        </div>

        <script src="{{ asset('js/app.js') }}"></script>
    </main>
</body>

</html>