<?php
use Illuminate\Support\Facades\Session;
use Gloudemans\Shoppingcart\Facades\Cart;
?>
@extends('layout')
@section('content')

	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="{{URL::to('/')}}">Trang chủ</a></li>
				  <li class="active">Giỏ hàng của bạn</li>
				</ol>
			</div>
			<div class="table-responsive ">
			<?php
				$content = Cart::content();
				
                $message = Session::get('message');
                if($message){
                  echo '<span class="text-alert">'.$message.'</span>';
                  Session::put('message',null);              
                  }          
                   ?>                                 
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="text">Tên tài khoản</td>
							<!-- <td class="description">Tên sp</td> -->
							
							<td class="quantity">Số lượng</td>
							<td class="total">Tổng</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
							@foreach($show_order as $key => $order)
							<tr>
								<td><label class="i-checks m-b-none"><input type="checkbox" name="post[]"><i></i></label></td>
								<td>{{ $order->order_id }}</td>
								<td>{{ $order->order_status }}</td>
								<td>{{ $order->order_total }}</td>
							</tr>
							@endforeach
					</tbody>
				</table>
			</div>
		</div>
	</section> 


@endsection