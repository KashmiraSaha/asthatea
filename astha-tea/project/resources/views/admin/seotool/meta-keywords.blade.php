@extends('layouts.admin')

@section('content')

<div class="content-area">
              <div class="mr-breadcrumb">
                <div class="row">
                  <div class="col-lg-12">
                      <h4 class="heading">{{ __('Meta Keywords') }}</h4>
                    <ul class="links">
                      <li>
                        <a href="{{ route('admin.dashboard') }}">{{ __('Dashboard') }} </a>
                      </li>
                      <li>
                        <a href="javascript:;">{{ __('SEO Tools') }}</a>
                      </li>
                      <li>
                        <a href="{{ route('admin-seotool-analytics') }}">{{ __('Meta Keywords') }}</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="add-product-content1">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="product-description">
                      <div class="body-area">
                        <div class="gocover" style="background: url({{asset('assets/images/'.$gs->admin_loader)}}) no-repeat scroll center center rgba(45, 45, 45, 0.5);"></div>
                        <form id="geniusform" action="{{ route('admin-seotool-analytics-update') }}" method="POST" enctype="multipart/form-data">
                          {{csrf_field()}}

                        @include('includes.admin.form-both')
                        <div class="row justify-content-center">
                            <div class="col-lg-3">
                              <div class="left-area">
                                <h4 class="heading">
                                    {{ __('Meta Title') }} *
                                </h4>
                              </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="tawk-area">
                                  <input  class="form-control" type="text" name="meta_title" value="{{ $tool->meta_title }}">
                                </div>
                            </div>
                          </div>
                          <div class="row justify-content-center">
                            <div class="col-lg-3">
                              <div class="left-area">
                                <h4 class="heading">
                                    {{ __('Meta Description') }} *
                                </h4>
                              </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="tawk-area">
                                  <textarea  name="meta_description">{{ $tool->meta_description }}</textarea>
                                </div>
                            </div>
                          </div>

                          <div class="row">
                            <div class="col-lg-4">
                              <div class="left-area">
                                  <h4 class="heading">{{ __('Meta keywords') }} *</h4>
                              </div>
                            </div>
                            <div class="col-lg-7">


                                <ul id="tags"  name="meta_keys" class="myTags" >
                                    @foreach (explode(',',$tool->meta_keys) as $element)
                                      <li  >{{ str_replace (array('[','"', ']'), '' , $element) }}</li>
                                    @endforeach
                                </ul>
                            </div>
                          </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">

                            </div>
                          </div>
                          <div class="col-lg-6">
                            <button class="addProductSubmit-btn" type="submit">{{ __('Save') }}</button>
                          </div>
                        </div>
                      </div>
                     </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>

@endsection
@section('scripts')

<script type="text/javascript">

          $("#tags").tagit({
          fieldName: 'meta_keys[]',
          allowSpaces: true
        });

</script>

@endsection
