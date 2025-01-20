using Godot;
using System;

public partial class ball : CharacterBody2D
{
    KinematicCollision2D collisionData;

    public override void _Ready()
    {
        base._Ready();
        Velocity = new Vector2(300, 0);
    }



    public override void _PhysicsProcess(double delta)
    {
        collisionData = MoveAndCollide(Velocity * new Vector2((float)delta, (float)delta));
        if (collisionData != null)
        {
            //randomize the y value a little
            RandomNumberGenerator r = new RandomNumberGenerator();
            Vector2 tempVelocity = Velocity;
            tempVelocity.Y += r.RandfRange(-20, 20);
            Velocity = tempVelocity;

            //bounce
            Velocity = Velocity.Bounce(collisionData.GetNormal());
        }
    }
}
