<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Page;
use App\Models\Product;
use App\Models\Slider;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    private const SHOP = 'M/S Shopna Shima Traders';

    private const PHONE = '01754471654';

    private const EMAIL = 'info@shopnashimatraders.com';

    public function run(): void
    {
        User::firstOrCreate(
            ['email' => env('ADMIN_EMAIL', 'admin@gmail.com')],
            [
                'name' => 'Admin',
                'password' => env('ADMIN_PASSWORD', 'admin000'),
                'phone' => self::PHONE,
            ]
        )->forceFill(['is_admin' => true])->save();

        User::firstOrCreate(
            ['email' => 'customer@gmail.com'],
            [
                'name' => 'Customer',
                'password' => 'customer000',
            ]
        );

        $categories = [];
        foreach ([
            ['Kitchen', 'kitchen', 'Bowls, mugs and food containers for the daily kitchen.', 'kitchen.jpg'],
            ['Storage', 'storage', 'Boxes and baskets to keep clothes and household goods in order.', 'storage.jpg'],
            ['Furniture', 'furniture', 'Plastic chairs and stools for home and shop use.', 'furniture.jpg'],
            ['Water', 'water', 'Bottles and jugs for drinking water at home.', 'water.jpg'],
            ['Bathroom', 'bathroom', 'Bathroom sets and pedal bins.', 'bathroom.jpg'],
            ['Cleaning', 'cleaning', 'Buckets and everyday cleaning helpers.', 'cleaning.jpg'],
        ] as $i => [$name, $slug, $description, $image]) {
            $categories[$slug] = Category::updateOrCreate(['slug' => $slug], [
                'name' => $name,
                'description' => $description,
                'image' => 'assets/images/categories/'.$image,
                'sort_order' => $i,
                'is_active' => true,
            ]);
        }

        foreach ($this->products() as $row) {
            [$name, $slug, $cat, $price, $sale, $variant, $image, $featured, $stock, $short, $specs] = $row;
            Product::updateOrCreate(['slug' => $slug], [
                'category_id' => $categories[$cat]->id,
                'name' => $name,
                'short_description' => $short,
                'description' => '<p>'.$short.'</p>'
                    .'<h3>Details</h3><ul>'.implode('', array_map(fn ($s) => '<li>'.e($s).'</li>', $specs)).'</ul>'
                    .'<h3>Why buy from '.e(self::SHOP).'?</h3><ul><li>Household plastic goods, including RFL products</li><li>Practical pieces for kitchen, storage and home</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',
                'price' => $price,
                'sale_price' => $sale,
                'stock' => $stock,
                'unit' => $variant,
                'image' => 'assets/images/products/'.$image,
                'is_featured' => $featured,
                'is_active' => true,
                'free_shipping' => false,
            ]);
        }

        Slider::query()->delete();
        $now = now();
        Slider::insert([
            ['title' => 'RFL Household Products', 'subtitle' => 'Kitchen, storage, furniture and water solutions for the home', 'image' => 'assets/images/slides/slide-1.jpg', 'link' => 'shop.html', 'position' => 'main', 'sort_order' => 1, 'is_active' => true, 'created_at' => $now, 'updated_at' => $now],
            ['title' => 'Stock the Kitchen', 'subtitle' => 'Bowls, containers, bottles and jugs at everyday prices', 'image' => 'assets/images/slides/slide-2.jpg', 'link' => 'shop.html?category=kitchen', 'position' => 'main', 'sort_order' => 2, 'is_active' => true, 'created_at' => $now, 'updated_at' => $now],
            ['title' => 'Kitchen', 'subtitle' => null, 'image' => 'assets/images/products/serving-bowls.jpg', 'link' => 'shop.html?category=kitchen', 'position' => 'side', 'sort_order' => 1, 'is_active' => true, 'created_at' => $now, 'updated_at' => $now],
            ['title' => 'Furniture', 'subtitle' => null, 'image' => 'assets/images/products/plastic-chair.jpg', 'link' => 'shop.html?category=furniture', 'position' => 'side', 'sort_order' => 2, 'is_active' => true, 'created_at' => $now, 'updated_at' => $now],
            ['title' => 'Water', 'subtitle' => null, 'image' => 'assets/images/products/water-jug.jpg', 'link' => 'shop.html?category=water', 'position' => 'side', 'sort_order' => 3, 'is_active' => true, 'created_at' => $now, 'updated_at' => $now],
        ]);

        foreach ($this->pages() as $slug => [$title, $content]) {
            Page::updateOrCreate(['slug' => $slug], ['title' => $title, 'content' => $content, 'is_active' => true]);
        }
    }

    /** [name, slug, category, price, sale price, variant, image, featured, stock, short description, specs] */
    private function products(): array
    {
        return [
            ['Serving Bowl Set', 'serving-bowl-set', 'kitchen', 650, 520, 'Set of 3', 'serving-bowls.jpg', true, 40,
                'A nested set of three serving bowls for rice, curry and everyday meals.',
                ['Set of 3 nested bowls', 'Light and easy to carry', 'Smooth rim', 'Easy to wash', 'For home and shop use']],
            ['Mug Set of 6', 'mug-set-of-6', 'kitchen', 360, 290, '6 mugs', 'mug-set.jpg', false, 70,
                'A set of six everyday plastic mugs for tea, water and family use.',
                ['6 mugs', 'Comfortable handle', 'Stackable', 'Easy to wash', 'Mixed red, white and navy']],
            ['Food Container Set', 'food-container-set', 'kitchen', 620, 510, 'Set of 3', 'food-containers.jpg', true, 45,
                'Three airtight food containers for leftovers, snacks and the fridge.',
                ['Set of 3', 'Locking lids', 'Clear body', 'Fridge friendly', 'Easy to stack']],

            ['Storage Box 40L', 'storage-box-40l', 'storage', 890, 740, '40 litre', 'storage-box.jpg', true, 30,
                'A large lidded storage box for clothes, toys and household goods.',
                ['About 40 litre capacity', 'Fitted lid', 'Strong side walls', 'Easy to stack', 'For bedroom, shop or store room']],
            ['Laundry Basket', 'laundry-basket', 'storage', 780, 650, 'Navy', 'laundry-basket.jpg', false, 28,
                'An oval laundry basket that is light to carry from room to room.',
                ['Open oval shape', 'Side handles', 'Lightweight', 'Airy sides', 'For clothes and linen']],

            ['Plastic Arm Chair', 'plastic-arm-chair', 'furniture', 1850, 1590, 'Red', 'plastic-chair.jpg', true, 20,
                'A sturdy armchair for dining, waiting areas and shop floors.',
                ['Armrests', 'Wide seat', 'Strong legs', 'Easy to wipe clean', 'Indoor and covered outdoor use']],
            ['Plastic Stool', 'plastic-stool', 'furniture', 480, 390, 'Red', 'plastic-stool.jpg', false, 50,
                'A compact four-leg stool for kitchen, bathroom and extra seating.',
                ['Four legs', 'Compact seat', 'Light to move', 'Easy to clean', 'Everyday home use']],

            ['2 Litre Water Bottle', '2-litre-water-bottle', 'water', 280, 220, '2 litre', 'water-bottle.jpg', true, 80,
                'A clear 2 litre water bottle with a firm cap for home and travel.',
                ['2 litre capacity', 'Clear body', 'Screw cap', 'Easy to refill', 'For drinking water']],
            ['2 Litre Water Jug', '2-litre-water-jug', 'water', 240, 190, '2 litre', 'water-jug.jpg', true, 60,
                'A 2 litre jug with a handle and lid for the dining table.',
                ['2 litre capacity', 'Handle and lid', 'Pouring spout', 'Light to carry', 'Table and fridge use']],

            ['Bathroom Accessory Set', 'bathroom-accessory-set', 'bathroom', 540, 450, '3 pieces', 'bathroom-set.jpg', false, 35,
                'A soap dish, tumbler and toothbrush holder for a tidy bathroom shelf.',
                ['Soap dish', 'Tumbler', 'Toothbrush holder', 'Easy to wipe', 'Countertop use']],
            ['Pedal Dustbin 15L', 'pedal-dustbin-15l', 'bathroom', 950, 790, '15 litre', 'pedal-bin.jpg', true, 22,
                'A pedal bin so the lid opens without touching it.',
                ['About 15 litre', 'Foot pedal', 'Removable inner bucket', 'Slow-close style lid', 'Bathroom or kitchen']],

            ['20 Litre Bucket with Lid', '20-litre-bucket-with-lid', 'cleaning', 420, 350, '20 litre', 'bucket.jpg', false, 55,
                'A 20 litre bucket with a matching lid for washing, storage and shop use.',
                ['About 20 litre', 'Matching lid', 'Strong handle', 'Easy to rinse', 'Home and shop use']],
        ];
    }

    private function pages(): array
    {
        $phone = self::PHONE;
        $email = self::EMAIL;
        $shop = self::SHOP;

        return [
            'about-us' => ['About Us', <<<HTML
<h2>Welcome to {$shop}</h2>
<p><strong>{$shop}</strong> sells RFL household products for the kitchen, storage, furniture, water, bathroom and cleaning. We keep practical plastic goods that families and shops use every day, and we deliver across Bangladesh.</p>
<hr>
<h3><i class="fa-solid fa-boxes-stacked"></i> What we offer</h3>
<ul class="icon-list">
<li><i class="fa-solid fa-utensils"></i><span><strong>Kitchen:</strong> bowls, mugs and food containers.</span></li>
<li><i class="fa-solid fa-box"></i><span><strong>Storage:</strong> boxes and laundry baskets.</span></li>
<li><i class="fa-solid fa-chair"></i><span><strong>Furniture:</strong> chairs and stools.</span></li>
<li><i class="fa-solid fa-bottle-water"></i><span><strong>Water:</strong> bottles and jugs.</span></li>
<li><i class="fa-solid fa-sink"></i><span><strong>Bathroom:</strong> accessory sets and pedal bins.</span></li>
<li><i class="fa-solid fa-bucket"></i><span><strong>Cleaning:</strong> buckets with lids.</span></li>
</ul>
<hr>
<h3><i class="fa-solid fa-award"></i> Why shop with us?</h3>
<ul class="icon-list">
<li><i class="fa-solid fa-circle-check"></i><span>RFL and everyday household products in one shop</span></li>
<li><i class="fa-solid fa-circle-check"></i><span>Clear prices and regular offers</span></li>
<li><i class="fa-solid fa-circle-check"></i><span>Cash on Delivery and secure online payment via shurjoPay (bKash, Nagad, Rocket, Visa, Mastercard)</span></li>
<li><i class="fa-solid fa-circle-check"></i><span>Home delivery all over Bangladesh</span></li>
</ul>
<hr>
<h3><i class="fa-solid fa-headset"></i> Contact us</h3>
<ul class="icon-list">
<li><i class="fa-solid fa-phone"></i><span>Phone: <a href="tel:{$phone}">{$phone}</a></span></li>
<li><i class="fa-brands fa-whatsapp"></i><span>WhatsApp: <a href="https://wa.me/8801754471654" target="_blank" rel="noopener">{$phone}</a></span></li>
<li><i class="fa-solid fa-envelope"></i><span>Email: <a href="mailto:{$email}">{$email}</a></span></li>
</ul>
HTML],
            'refund-returns' => ['Refund and Returns Policy', <<<HTML
<h2>Refund &amp; Returns Policy</h2>
<p>At <strong>{$shop}</strong> we want the product you receive to match the one you ordered. If it does not, this is how returns and refunds work.</p>
<h3><i class="fa-solid fa-circle-check"></i> Eligible for return / replacement</h3>
<ul class="icon-list">
<li><i class="fa-solid fa-circle-check"></i><span><strong>Wrong product delivered:</strong> the item, size or colour is different from your order.</span></li>
<li><i class="fa-solid fa-circle-check"></i><span><strong>Damaged on arrival:</strong> cracks, breaks or a missing part found at delivery.</span></li>
<li><i class="fa-solid fa-circle-check"></i><span><strong>Missing items:</strong> pieces listed with a set are missing.</span></li>
</ul>
<p>Please tell us within <strong>3 days of delivery</strong> and share photos of the product and the packaging.</p>
<h3><i class="fa-solid fa-circle-xmark"></i> Not eligible</h3>
<ul class="icon-list">
<li><i class="fa-solid fa-circle-xmark"></i><span>Products damaged after delivery or used beyond a quick check</span></li>
<li><i class="fa-solid fa-circle-xmark"></i><span>Items returned without the original box or invoice</span></li>
<li><i class="fa-solid fa-circle-xmark"></i><span>Change of mind after the product has been used</span></li>
</ul>
<h3><i class="fa-solid fa-rotate-left"></i> Refund process</h3>
<ul>
<li>Once we receive and check the return, we confirm a refund or a replacement.</li>
<li>Approved refunds are processed within <strong>5 to 7 business days</strong>.</li>
<li>Online payments made through shurjoPay are refunded to the original payment method. Cash on Delivery orders are refunded via bKash, Nagad or bank transfer.</li>
<li>Delivery charges are refunded only when the return is our mistake.</li>
</ul>
<h3><i class="fa-solid fa-headset"></i> Contact us</h3>
<p>For a return or refund question, call or message us.</p>
<ul class="icon-list">
<li><i class="fa-solid fa-phone"></i><span>Phone: <a href="tel:{$phone}">{$phone}</a></span></li>
<li><i class="fa-brands fa-whatsapp"></i><span>WhatsApp: <a href="https://wa.me/8801754471654" target="_blank" rel="noopener">{$phone}</a></span></li>
</ul>
HTML],
            'terms-conditions' => ['Terms & Conditions', <<<HTML
<h2>Terms &amp; Conditions</h2>
<p>By using the {$shop} website or placing an order, you agree to these terms.</p>
<h3>1. Products &amp; pricing</h3>
<ul>
<li>All prices are in Bangladeshi Taka (৳).</li>
<li>Product photos show the item. Colour and packaging can vary slightly.</li>
<li>Prices, offers and stock can change without notice. RFL product names refer to goods we stock from that range.</li>
</ul>
<h3>2. Orders</h3>
<ul>
<li>We may call you to confirm an order before it is shipped.</li>
<li>We may cancel an order if a product is out of stock, the price was listed incorrectly, or the details cannot be verified. Any payment already taken is refunded in full.</li>
</ul>
<h3>3. Payment</h3>
<ul>
<li>We accept Cash on Delivery and online payment through <strong>shurjoPay</strong> (bKash, Nagad, Rocket, Visa, Mastercard and other supported methods).</li>
<li>Online payments are processed by shurjoPay. We never see or store your card or wallet PIN.</li>
</ul>
<h3>4. Delivery</h3>
<ul>
<li>Inside Dhaka: usually within 24 to 48 hours. Outside Dhaka: usually within 2 to 5 business days.</li>
<li>Please check the product before you accept it.</li>
<li>If delivery fails because of a wrong address or an unreachable phone, a re-delivery charge may apply.</li>
</ul>
<h3>5. Privacy</h3>
<p>Your name, phone number and address are used to process and deliver your order. They are not sold to anyone else.</p>
<h3>6. Returns</h3>
<p>See our <a href="refund-returns.html">Refund &amp; Returns Policy</a>.</p>
<h3>7. Contact</h3>
<ul class="icon-list">
<li><i class="fa-solid fa-phone"></i><span>Phone: <a href="tel:{$phone}">{$phone}</a></span></li>
<li><i class="fa-brands fa-whatsapp"></i><span>WhatsApp: <a href="https://wa.me/8801754471654" target="_blank" rel="noopener">{$phone}</a></span></li>
</ul>
HTML],
        ];
    }
}
