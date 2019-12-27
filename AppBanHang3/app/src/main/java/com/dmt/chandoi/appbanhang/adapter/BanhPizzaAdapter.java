package com.dmt.chandoi.appbanhang.adapter;

import android.content.Context;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.ViewFlipper;

import com.dmt.chandoi.appbanhang.R;
import com.dmt.chandoi.appbanhang.model.SanPham;
import com.squareup.picasso.Picasso;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class BanhPizzaAdapter extends BaseAdapter {
    Context content;

    public BanhPizzaAdapter(Context content, ArrayList<SanPham> arrayBanhPizza) {
        this.content = content;
        this.arrayBanhPizza = arrayBanhPizza;
    }

    ArrayList<SanPham> arrayBanhPizza;

    @Override
    public int getCount() {
        return arrayBanhPizza.size();
    }

    @Override
    public Object getItem(int i) {
        return arrayBanhPizza.get(i);
    }

    @Override
    public long getItemId(int i) {
        return i;
    }
    public class ViewHolder
    {
        public TextView txttenBanhPizza,txtgiaBanhPizza,txtmotaBanhPizza;
        public ImageView imagBanhpiza;

    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        ViewHolder viewHolder=null;
        if(view==null) {
            viewHolder = new ViewHolder();
            LayoutInflater inflater = (LayoutInflater) content.getSystemService(content.LAYOUT_INFLATER_SERVICE);
            view = inflater.inflate(R.layout.dong_banhpizza, null);
            viewHolder.txttenBanhPizza = (TextView) view.findViewById(R.id.textviewBanhPizza);
            viewHolder.txtgiaBanhPizza = (TextView) view.findViewById(R.id.textviewgiaBanhPizza);
            viewHolder.txtmotaBanhPizza = (TextView) view.findViewById(R.id.textviewmotaBanhPizza);
            viewHolder.imagBanhpiza = (ImageView) view.findViewById(R.id.imageviewBanhPizza);
            view.setTag(viewHolder);
        }
        else {
            viewHolder = (ViewHolder) view.getTag();
        }
        SanPham sanpham = (SanPham) getItem(i);
        viewHolder.txttenBanhPizza.setText(sanpham.getTensanpham());
        DecimalFormat decimalFormat=new DecimalFormat("###,###,###");
        viewHolder.txtgiaBanhPizza.setText("giá:" + decimalFormat.format(sanpham.getGiasanpham())+"Đ");
        viewHolder.txtmotaBanhPizza.setMaxLines(2);
        viewHolder.txtmotaBanhPizza.setEllipsize(TextUtils.TruncateAt.END);
        viewHolder.txtmotaBanhPizza.setText(sanpham.getMotasanpham());
        Picasso.with(content).load(sanpham.getHinhanhsanpham())
                              .placeholder(R.drawable.common_google_signin_btn_icon_dark_disabled)
                              .error(R.drawable.error)
                              .into(viewHolder.imagBanhpiza);

        return view;
    }
}
