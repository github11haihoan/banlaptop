<?php

namespace App\Http\Controllers;

use App\Slider;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;
session_start();

class HomeController extends Controller
{
    public function index(Request $request){
        $slider = Slider::orderBy('slider_id','DESC')->where('slider_status','1')->take(4)->get();

    	$cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','desc')->get(); 
        $brand_product = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','desc')->get(); 

        // $all_product = DB::table('tbl_product')
        // ->join('tbl_category_product','tbl_category_product.category_id','=','tbl_product.category_id')
        // ->join('tbl_brand','tbl_brand.brand_id','=','tbl_product.brand_id')
        // ->orderby('tbl_product.product_id','desc')->get();
        
         $all_product = DB::table('tbl_product')->where('product_status','0')->orderby('product_id','desc')->limit(6)->get(); 

    	return view('pages.home')->with('category',$cate_product)->with('brand',$brand_product)->with('all_product',$all_product)->with('slider',$slider);
    }
    public function search(Request $request){
        //slide
       $slider = Slider::orderBy('slider_id','DESC')->where('slider_status','1')->take(4)->get();

       //seo 
       $meta_desc = "Tìm kiếm sản phẩm"; 
       $meta_keywords = "Tìm kiếm sản phẩm";
       $meta_title = "Tìm kiếm sản phẩm";
       $url_canonical = $request->url();
       //--seo
       $keywords = $request->keywords_submit;

       $cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','desc')->get(); 
       $brand_product = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','desc')->with('slider',$slider)->get(); 

       $search_product = DB::table('tbl_product')->where('product_name','like','%'.$keywords.'%')->get(); 


       return view('pages.sanpham.search')->with('category',$cate_product)->with('brand',$brand_product)->with('search_product',$search_product)->with('meta_desc',$meta_desc)->with('meta_keywords',$meta_keywords)->with('meta_title',$meta_title)->with('url_canonical',$url_canonical)->with('slider',$slider);

   }
        public function purchase_history(Request $request){
            $slider = Slider::orderBy('slider_id','DESC')->where('slider_status','1')->take(4)->get();
            $show_order = DB::table('tbl_order')
            ->join('tbl_customers','tbl_order.customer_id','=','tbl_customers.customer_id')
            ->join('tbl_order_details','tbl_order.order_id','=','tbl_order_details.order_id')
            ->select('tbl_order.*','tbl_customers.customer_name')->first();
            $manager_order  = view('pages.his.show_order')->with('show_order',$show_order);
            return view('layout')->with('pages.his.show_order', $manager_order)->with('slider',$slider);
    }
   
}
