<?php

namespace App\Http\Controllers;

use App\Models\invoices;
use App\Http\Requests\StoreinvoicesRequest;
use App\Http\Requests\UpdateinvoicesRequest;

class InvoicesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return invoices::all();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreinvoicesRequest $request)
    {
        return invoices::create($request->all());
        $request->validate([
            'order_id' => 'required',
            'customer_name' => 'required',
            'invoice_number' => 'required',
            'total_amount' => 'required',
            'quantity' => 'required',
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return invoices::find($id);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateinvoicesRequest $request, string $id)
    {
        $invoice = invoices::find($id);
        $invoice->update($request->all());
        return $invoice; 
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return invoices::destroy($id);
    }
}
