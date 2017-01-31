var chocOutput = {
  nodes: [
   { data: { id: 'root', name: 'root', noun: 'lightgrey' } },
 { data: { id: 'homepage', name: 'homepage', noun: 'lightgrey' } },
 { data: { id: 'categories', name: 'categories', noun: 'lightgrey' } },
 { data: { id: 'review', name: 'review', noun: 'lightgrey' } },
 { data: { id: 'reviews', name: 'reviews', noun: 'lightgrey' } },
 { data: { id: 'products', name: 'products', noun: 'lightgrey' } },
 { data: { id: 'product', name: 'product', noun: 'lightgrey' } },
 { data: { id: 'cart', name: 'cart', noun: 'lightgrey' } },
 { data: { id: 'invoice', name: 'invoice', noun: 'green' } },
 { data: { id: 'vendors', name: 'vendors', noun: 'lightgrey' } },
 { data: { id: 'vendor', name: 'vendor', noun: 'lightgrey' } },
 { data: { id: 'error', name: 'error', noun: 'red' } },

  ],
  edges: [
   { data: { source: 'root', target: 'homepage', label: 'shoppe', color: 'green' } },
 { data: { source: 'homepage', target: 'product', label: 'top_5_product_id', color: 'green' } },
 { data: { source: 'homepage', target: 'categories', label: 'by_category', color: 'green' } },
 { data: { source: 'homepage', target: 'vendors', label: 'by_vendor', color: 'green' } },
 { data: { source: 'categories', target: 'products', label: 'category_id', color: 'green' } },
 { data: { source: 'products', target: 'product', label: 'product_id', color: 'green' } },
 { data: { source: 'products', target: 'products', label: 'by_rating', color: 'green' } },
 { data: { source: 'product', target: 'reviews', label: 'reviews', color: 'green' } },
 { data: { source: 'reviews', target: 'review', label: 'review_id', color: 'green' } },
 { data: { source: 'reviews', target: 'review', label: 'add', color: 'purple' } },
 { data: { source: 'review', target: 'review', label: 'edit', color: 'blue' } },
 { data: { source: 'product', target: 'cart', label: 'add', color: 'purple' } },
 { data: { source: 'cart', target: 'cart', label: 'remove', color: 'red' } },
 { data: { source: 'cart', target: 'invoice', label: 'buy', color: 'purple' } },
 { data: { source: 'product', target: 'vendor', label: 'vendor_id', color: 'green' } },
 { data: { source: 'vendors', target: 'vendor', label: 'vendor_id', color: 'green' } },
 { data: { source: 'vendor', target: 'products', label: 'products', color: 'green' } },
 { data: { source: 'error', target: 'root', label: 'home', color: 'green' } },

  ]
};
