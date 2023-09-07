{{-- Top Start --}}
@include('admin.includes.top')
{{-- Top Start --}}



{{-- Main Content Start --}}

<div id="wrapper">

    {{-- Navbar Start --}}
    @include('admin.includes.navbar')
    {{-- Navbar Start --}}


    {{-- Aside Start --}}
    @include('admin.includes.aside')
    {{-- Aside Start --}}



    {{-- Content Start --}}
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">@yield("title-contnet")</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>



            @yield('content')


        </div>
    </div>
    {{-- Content End --}}

</div>




{{-- Main Content End --}}





{{-- Bottom Start --}}
@include('admin.includes.bottom')
{{-- Bottom Start --}}
