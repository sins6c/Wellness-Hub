from PIL import Image, ImageDraw, ImageFont
import os

def create_placeholder_image(width, height, text, filename):
    # Create a new image with a purple background
    image = Image.new('RGB', (width, height), (46, 43, 77))
    draw = ImageDraw.Draw(image)
    
    # Try to load a font, fallback to default if not available
    try:
        font = ImageFont.truetype("arial.ttf", 40)
    except:
        font = ImageFont.load_default()
    
    # Calculate text position to center it
    text_bbox = draw.textbbox((0, 0), text, font=font)
    text_width = text_bbox[2] - text_bbox[0]
    text_height = text_bbox[3] - text_bbox[1]
    x = (width - text_width) / 2
    y = (height - text_height) / 2
    
    # Draw the text
    draw.text((x, y), text, fill=(255, 255, 255), font=font)
    
    # Save the image
    image.save(f'assets/images/{filename}')
    print(f'Created {filename}')

def main():
    # Create assets/images directory if it doesn't exist
    os.makedirs('assets/images', exist_ok=True)
    
    # Create onboarding images
    create_placeholder_image(800, 600, "Welcome to\nWellness Hub", "onboarding1.png")
    create_placeholder_image(800, 600, "Track Your\nWellness", "onboarding2.png")
    create_placeholder_image(800, 600, "Discover\nServices", "onboarding3.png")
    
    # Create service images
    create_placeholder_image(400, 300, "Spa Services", "spa_services.jpg")
    create_placeholder_image(400, 300, "Home Help", "home_help.jpg")
    create_placeholder_image(400, 300, "Medicines", "medicines.jpg")
    create_placeholder_image(400, 300, "Diet Plans", "diet_plans.jpg")
    create_placeholder_image(400, 300, "Mental Wellness", "mental_wellness.jpg")
    create_placeholder_image(400, 300, "Pet Therapy", "pet_therapy.jpg")
    
    # Create banner image
    create_placeholder_image(1200, 400, "Special Deals\n& Offers", "deals_banner.png")
    
    # Create profile image
    create_placeholder_image(400, 400, "Profile\nPicture", "profile.jpg")

if __name__ == '__main__':
    main() 