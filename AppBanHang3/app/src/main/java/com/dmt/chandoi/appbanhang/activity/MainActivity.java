package com.dmt.chandoi.appbanhang.activity;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.AdapterView;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.Toast;
import android.widget.ViewFlipper;

import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.Volley;
import com.dmt.chandoi.appbanhang.R;
import com.dmt.chandoi.appbanhang.adapter.LoaiSanPhamAdapter;
import com.dmt.chandoi.appbanhang.model.GioHang;
import com.dmt.chandoi.appbanhang.model.Loaisp;
import com.dmt.chandoi.appbanhang.model.SanPham;
import com.dmt.chandoi.appbanhang.model.SanPhamAdapter;
import com.dmt.chandoi.appbanhang.ultil.CheckConnection;
import com.dmt.chandoi.appbanhang.ultil.Server;
import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    ArrayList<Loaisp> mangloaisp;
    ArrayList<SanPham> mangSanpham;
    SanPhamAdapter sanphamAdapter;
    LoaiSanPhamAdapter loaispAdapter;
    DrawerLayout drawerLayout;
    Animation in, out;
    Toolbar toolbar;
    ViewFlipper viewFlipper;
    RecyclerView recyclerViewManHinhChinh;
    NavigationView navigationView;
    ListView lvManHinhChinh;
    int id = 0;
    String tenloaisp = "";
    String hinhanhloaisp = "";
    public static ArrayList<GioHang> mangGioHang;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        anhXa();
        if (CheckConnection.haveNetworkConnection(MainActivity.this)) {
            actionBar();
            addEEventViewFlipper();
            getdulieuloaisp();
            getdulieuSpmoinhat();
            catchOnItemListView();
        } else {
            CheckConnection.showToast_Short(MainActivity.this, "khong co ket noi intenret");
            finish();
        }
    }

    private void catchOnItemListView() {
        lvManHinhChinh.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                switch (i) {
                    case 0: {
                        if (CheckConnection.haveNetworkConnection(MainActivity.this)) {
                            Log.d("test", "t1");
                            Intent intent = new Intent(MainActivity.this, MainActivity.class);
                            startActivity(intent);

                        }
                        drawerLayout.closeDrawer(GravityCompat.START);
                        break;
                    }
                    case 1: {
                        if (CheckConnection.haveNetworkConnection(MainActivity.this)) {
                            Intent intent = new Intent(MainActivity.this, DienThoaiActivity.class);
                            intent.putExtra("idloaisanpham", 1);
                            startActivity(intent);
                        } else {
                        }
                        drawerLayout.closeDrawer(GravityCompat.START);
                        break;
                    }
                    case 2: {
                        if (CheckConnection.haveNetworkConnection(MainActivity.this)) {
                            Intent intent = new Intent(MainActivity.this, DienThoaiActivity.class);
                            intent.putExtra("idloaisanpham", 2);
                            startActivity(intent);
                        } else {
                        }
                        drawerLayout.closeDrawer(GravityCompat.START);
                        break;
                    }
                    case 3: {
                        if (CheckConnection.haveNetworkConnection(MainActivity.this)) {
                            Intent intent = new Intent(MainActivity.this, DienThoaiActivity.class);
                            intent.putExtra("idloaisanpham", 3);
                            startActivity(intent);
                        } else {
                        }
                        drawerLayout.closeDrawer(GravityCompat.START);
                        break;
                    }
                    case 4: {
                        if (CheckConnection.haveNetworkConnection(MainActivity.this)) {
                            Intent intent = new Intent(MainActivity.this, DienThoaiActivity.class);
                            intent.putExtra("idloaisanpham", 4);
                            startActivity(intent);
                        } else {
                        }
                        drawerLayout.closeDrawer(GravityCompat.START);
                        break;
                    }
                    case 5: {
                        if (CheckConnection.haveNetworkConnection(MainActivity.this)) {
                            Intent intent = new Intent(MainActivity.this, DienThoaiActivity.class);
                            intent.putExtra("idloaisanpham", 5);
                            startActivity(intent);
                        } else {
                        }
                        drawerLayout.closeDrawer(GravityCompat.START);
                        break;
                    }
                    case 6: {
                        if (CheckConnection.haveNetworkConnection(MainActivity.this)) {
                            Intent intent = new Intent(MainActivity.this, DienThoaiActivity.class);
                            intent.putExtra("idloaisanpham", 6);
                            startActivity(intent);
                        } else {
                        }
                        drawerLayout.closeDrawer(GravityCompat.START);
                        break;
                    }
                    case 7: {
                        if (CheckConnection.haveNetworkConnection(MainActivity.this)) {
                            Intent intent = new Intent(MainActivity.this, DienThoaiActivity.class);
                            intent.putExtra("idloaisanpham", 7);
                            startActivity(intent);
                        } else {
                        }
                        drawerLayout.closeDrawer(GravityCompat.START);
                        break;
                    }
                    case 8: {
                        if (CheckConnection.haveNetworkConnection(MainActivity.this)) {
                            Intent intent = new Intent(MainActivity.this, LienHeActivity.class);
                            startActivity(intent);
                        }
                        drawerLayout.closeDrawer(GravityCompat.START);
                        break;
                    }
                    case 9: {
                        if (CheckConnection.haveNetworkConnection(MainActivity.this)) {
                            Intent intent = new Intent(MainActivity.this, ThongTinActivity.class);
                            startActivity(intent);
                        }
                        drawerLayout.closeDrawer(GravityCompat.START);
                        break;
                    }



                }
            }
        });
    }

    private void getdulieuloaisp() {
        final RequestQueue requestQueue = Volley.newRequestQueue(MainActivity.this);
        final JsonArrayRequest jsonArrayRequest = new JsonArrayRequest(Server.duongdanloaisp, new Response.Listener<JSONArray>() {
            @Override
            public void onResponse(JSONArray response) {
                for (int i = 0; i < response.length(); i++) {
                    try {
                        JSONObject object = response.getJSONObject(i);
                        id = object.getInt("id");
                        tenloaisp = object.getString("tenloaisanpham");
                        hinhanhloaisp = object.getString("hinhanhloaisanpham");
                        mangloaisp.add(new Loaisp(id, tenloaisp, hinhanhloaisp));
                        loaispAdapter.notifyDataSetChanged();
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
                mangloaisp.add(new Loaisp(0, "Liên Hệ", "http://capnuocbenthanh.com/images/dtlienhe_1.jpg"));
                mangloaisp.add(new Loaisp(0, "Thông Tin", "http://kinhtevadubao.vn/uploads/images/news/1515687283_news_10383.jpg"));
                loaispAdapter.notifyDataSetChanged();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
            }
        });
        requestQueue.add(jsonArrayRequest);
    }
    private void getdulieuSpmoinhat() {
        final RequestQueue request = Volley.newRequestQueue(MainActivity.this);
        JsonArrayRequest json = new JsonArrayRequest(Server.duongdansanphammoinhat,new Response.Listener<JSONArray>() {
            @Override
            public void onResponse(JSONArray response) {
                int id = 0, gia = 0;
                String tensanham = "";
                String mota = "", hinhanh = "";
                int idsp = 0;
                for (int i = 0; i < response.length(); i++) {
                    try {
                        JSONObject object = response.getJSONObject(i);
                        id = object.getInt("id");
                        tensanham = object.getString("tensp");
                        gia = object.getInt("giasp");
                        hinhanh = "http://"+Server.localhost+"/source/image/product/"+object.getString("hinhanhsp");

                        //http://192.168.1.4/SourceOpen/public/source/image/product/111.jpg
                        mota = object.getString("motasp");
                        idsp = object.getInt("idloaisp");
                        mangSanpham.add(new SanPham(id, tensanham, gia, hinhanh, mota, idsp));
                        sanphamAdapter.notifyDataSetChanged();
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d("kiemtra", error.toString());
                Toast.makeText(MainActivity.this, error.toString(), Toast.LENGTH_SHORT).show();
            }
        });
        request.add(json);
    }
    private void actionBar() {
        setSupportActionBar(toolbar);
        getSupportActionBar().setTitle("Pet Shop");
//        getSupportActionBar().setBackgroundDrawable();

//        getSupportActionBar().setLogo(R.drawable.logo);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar.setNavigationIcon(android.R.drawable.ic_menu_sort_by_size);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                drawerLayout.openDrawer(GravityCompat.START);
            }
        });
    }

    private void anhXa() {
        in = AnimationUtils.loadAnimation(MainActivity.this, R.anim.fade_in);
        out = AnimationUtils.loadAnimation(MainActivity.this, R.anim.fade_out);
        toolbar = (Toolbar) findViewById(R.id.toolbar_manhinhchinh);
        viewFlipper = (ViewFlipper) findViewById(R.id.viewflipper);
        recyclerViewManHinhChinh = (RecyclerView) findViewById(R.id.recyclerview);
        navigationView = (NavigationView) findViewById(R.id.navigationview);
        lvManHinhChinh = (ListView) findViewById(R.id.lv_manhinhchinh);
        drawerLayout = (DrawerLayout) findViewById(R.id.drawerlayout);
        mangloaisp = new ArrayList<Loaisp>();
        mangloaisp.add(new Loaisp(0, "Trang chủ", "https://png.pngtree.com/png-vector/20190228/ourmid/pngtree-home-vector-icon-png-image_711733.jpg"));
        loaispAdapter = new LoaiSanPhamAdapter(MainActivity.this, R.layout.dong_listview_loaisp, mangloaisp);
        lvManHinhChinh.setAdapter(loaispAdapter);
        mangSanpham = new ArrayList<SanPham>();
        sanphamAdapter = new SanPhamAdapter(MainActivity.this, mangSanpham);
        recyclerViewManHinhChinh.setHasFixedSize(true);
        recyclerViewManHinhChinh.setLayoutManager(new GridLayoutManager(MainActivity.this, 2));
        recyclerViewManHinhChinh.setAdapter(sanphamAdapter);
        if (mangGioHang != null) {

        } else {
            mangGioHang = new ArrayList<>();
        }
    }

    private void addEEventViewFlipper() {
        ArrayList<String> arrQuangCao = new ArrayList<>();
        arrQuangCao.add("http://"+Server.localhost+"/source/image/product/bai-8-9-sieu-sale-lzd-9-9.jpg");
        arrQuangCao.add("http://"+Server.localhost+"/source/image/product/Bingos-Halloween-Promo-2018_Website.png");
        arrQuangCao.add("http://"+Server.localhost+"/source/image/product/66629179-2400121930245605-7225420552893104128-n.jpg");
        arrQuangCao.add("http://"+Server.localhost+"/source/image/product/thuc-an-golden-pet-meo-con-533f4e44-227d-49f2-916c-6801f71eced9.jpg");
        for (int i = 0; i < arrQuangCao.size(); i++) {
            ImageView imageView = new ImageView(MainActivity.this);
            Picasso.with(MainActivity.this).load(arrQuangCao.get(i)).into(imageView);
            imageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
            viewFlipper.addView(imageView);
        }
        viewFlipper.setFlipInterval(4000);
        viewFlipper.setInAnimation(in);
        viewFlipper.setOutAnimation(out);
        viewFlipper.setAutoStart(true);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_item, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.menu_giohang) {
            Intent intent = new Intent(MainActivity.this, GioHangActivity.class);
            startActivity(intent);
        }
        return super.onOptionsItemSelected(item);
    }
    public class readJson extends AsyncTask<String,Void,String>{

        @Override
        protected String doInBackground(String... strings) {
            StringBuilder stringBuilder=new StringBuilder();
            try {
                URL url=new URL(strings[0]);
                HttpURLConnection httpURLConnection= (HttpURLConnection) url.openConnection();
                httpURLConnection.connect();
                InputStream inputStream=httpURLConnection.getInputStream();
                InputStreamReader inputStreamReader=new InputStreamReader(inputStream);
                BufferedReader bufferedReader=new BufferedReader(inputStreamReader);
                String line="";
                while ((line=bufferedReader.readLine())!=null){
                    stringBuilder.append(line);
                }
            } catch (MalformedURLException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return stringBuilder.toString();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Toast.makeText(MainActivity.this, s, Toast.LENGTH_SHORT).show();
            try {
                JSONArray jsonArray=new JSONArray(s);
                int id = 0, gia = 0;
                String tensanham = "";
                String mota = "", hinhanh = "";
                int idsp = 0;
                Log.d("kiemtra",jsonArray.toString()+"chn doi");
                for (int i = 0; i < jsonArray.length(); i++) {
                    try {
                        JSONObject object = jsonArray.getJSONObject(i);
                        id = object.getInt("id");
                        tensanham = object.getString("tensp");
                        gia = object.getInt("giasp");
                        hinhanh = "http://"+Server.localhost+"/source/image/product/"+object.getString("hinhanhsp");
                     //   Toast.makeText(MainActivity.this,Integer.toString(gia), Toast.LENGTH_LONG).show();
                        Toast.makeText(MainActivity.this,"hello", Toast.LENGTH_LONG).show();
                        mota = object.getString("motasp");
                        idsp = object.getInt("idsp");
                        mangSanpham.add(new SanPham(id, tensanham, gia, hinhanh, mota, idsp));
                        sanphamAdapter.notifyDataSetChanged();
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }
}
