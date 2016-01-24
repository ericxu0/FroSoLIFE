package layout;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.Switch;
import android.widget.TextView;

import com.example.alexander.frosolife.R;

import java.util.ArrayList;
import java.util.Scanner;

/**
 * A simple {@link Fragment} subclass.
 * Activities that contain this fragment must implement the
 * {@link ItemsFragment.OnFragmentInteractionListener} interface
 * to handle interaction events.
 * Use the {@link ItemsFragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class ItemsFragment extends Fragment implements AdapterView.OnItemClickListener {
    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    private boolean addingItem = false;
    private int addItemId;
    private int dahadawaId;
    private int cancelId;

    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;

    private ArrayList<String[]> itemDescriptions;
    private ArrayList<String> itemsList;

    private OnFragmentInteractionListener mListener;

    public ItemsFragment() {
        // Required empty public constructor
        itemDescriptions = new ArrayList<>();
        addItemId = View.generateViewId();
        dahadawaId = View.generateViewId();
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment ItemsFragment.
     */
    // TODO: Rename and change types and number of parameters
    public static ItemsFragment newInstance(String param1, String param2) {
        ItemsFragment fragment = new ItemsFragment();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }
        itemsList = readAllItems();
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        //Log.d("plsno", "Items Fragment View created");
        return inflater.inflate(R.layout.items_fragment, container, false);
    }

    @Override
    public void onStart(){
        super.onStart();

        loadItemsList();
    }

    // TODO: Rename method, update argument and hook method into UI event
    public void onButtonPressed(Uri uri) {
        if (mListener != null) {
            mListener.onFragmentInteraction(uri);
        }
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        if (context instanceof OnFragmentInteractionListener) {
            mListener = (OnFragmentInteractionListener) context;
        } else {
            throw new RuntimeException(context.toString()
                    + " must implement OnFragmentInteractionListener");
        }
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }

    public void loadItemsList() {
        //loads up list

        ArrayAdapter<String> adapter = new ArrayAdapter<>(this.getActivity(),android.R.layout.simple_list_item_1,itemsList);
        ListView itemsListView = (ListView) getActivity().findViewById(R.id.itemsList);
        itemsListView.setOnItemClickListener(this);
//        Log.d("plsno",itemsListView.toString());

        itemsListView.setAdapter(adapter);
    }

    public void cancelItemAdd(View view) {
        EditText itemName = (EditText)getActivity().findViewById(addItemId);
        Switch dahadawa = (Switch) getActivity().findViewById(dahadawaId);
        Button addItemButton = (Button) getActivity().findViewById(R.id.addItemButton);
        LinearLayout itemsFragmentLayout = (LinearLayout) getActivity().findViewById(R.id.items_fragment_layout);

        itemsFragmentLayout.removeView(itemName);
        itemsFragmentLayout.removeView(dahadawa);
        itemsFragmentLayout.removeView(view);

        TextView heading = (TextView) getActivity().findViewById(R.id.itemDetailsTextView);
        heading.setText("Select an Item for Details");

        addItemButton.setText(R.string.add_item);
        addingItem = false;
    }

    public void addItem(View view){
        LinearLayout itemsFragmentLayout = (LinearLayout) getActivity().findViewById(R.id.items_fragment_layout);
        EditText itemName;
        Switch dahadawa;
        Button cancelAdd;
        if(addingItem) {
            itemName = (EditText)getActivity().findViewById(addItemId);
            dahadawa = (Switch) getActivity().findViewById(dahadawaId);
            cancelAdd = (Button) getActivity().findViewById(cancelId);

            String[] itemDescription = new String[3];

            itemDescription[1] = "" +itemName.getText();
            itemDescription[2] = "Alexander Stroud";

            if(dahadawa.isChecked()){
                //dawa
                itemDescription[0] = "DAWA";
                itemsList.add("DAWA\t " +itemName.getText());
            } else {
                //daha
                itemDescription[0] = "DAHA";
                itemsList.add("DAHA\t " +itemName.getText());
            }
            itemDescriptions.add(itemDescription);

            itemsFragmentLayout.removeView(itemName);
            itemsFragmentLayout.removeView(dahadawa);
            itemsFragmentLayout.removeView(cancelAdd);
            ((Button) view).setText(R.string.add_item);

            TextView heading = (TextView) getActivity().findViewById(R.id.itemDetailsTextView);
            heading.setText("Select an Item for Details");

            addingItem = false;

            loadItemsList();
        } else {

            itemName = new EditText(getActivity());
            itemName.setHint("Item Name");
            LinearLayout.LayoutParams inlllp = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, 128);
            inlllp.setMargins(16, 16, 16, 16);
            itemName.setId(addItemId);
            itemName.setLayoutParams(inlllp);

            dahadawa = new Switch(getActivity());
            LinearLayout.LayoutParams lllp = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            lllp.gravity = Gravity.CENTER;
            dahadawa.setTextOff("DAHA");
            dahadawa.setTextOn("DAWA");
            dahadawa.setLayoutParams(lllp);
            dahadawa.setId(dahadawaId);

            cancelAdd = new Button(getActivity());
            cancelAdd.setLayoutParams(lllp);
            cancelAdd.setId(cancelId);
            cancelAdd.setText(R.string.cancel);
            cancelAdd.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    cancelItemAdd(v);
                }
            });

            TextView heading = (TextView) getActivity().findViewById(R.id.itemDetailsTextView);
            heading.setText("Adding New Item");

            itemsFragmentLayout.addView(cancelAdd,2);
            itemsFragmentLayout.addView(dahadawa,2);
            itemsFragmentLayout.addView(itemName,2);

            ((Button) view).setText(R.string.confirm);

            addingItem = true;
        }
    }

    private ArrayList<String> readAllItems() {
        int count = 0;

        ArrayList<String> itemsList = new ArrayList<>();

        Scanner scan = new Scanner(getResources().openRawResource(R.raw.items));
        while (scan.hasNextLine()) {
            String line = scan.nextLine();
            String[] pieces = line.split("\t");
            itemsList.add(pieces[0] +"\t " +pieces[1]);
            //pieces: "DAHA or DAWA", "Item Description", "Person Offering/Wanting"

            itemDescriptions.add(pieces);
            Log.d("array",pieces[0] +" " +pieces[1] + " " +pieces[2]);
        }

        return itemsList;
    }

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        //find top text view
        TextView description = (TextView) getActivity().findViewById(R.id.itemDetailsTextView);
        Log.d("plsno","onItemClick called in ItemsFragment");
        Log.d("plsno",description.toString());
        description.setText("Talk to " + itemDescriptions.get(position)[2]);
    }

    /**
     * This interface must be implemented by activities that contain this
     * fragment to allow an interaction in this fragment to be communicated
     * to the activity and potentially other fragments contained in that
     * activity.
     * <p/>
     * See the Android Training lesson <a href=
     * "http://developer.android.com/training/basics/fragments/communicating.html"
     * >Communicating with Other Fragments</a> for more information.
     */
    public interface OnFragmentInteractionListener {
        // TODO: Update argument type and name
        void onFragmentInteraction(Uri uri);
    }
}
